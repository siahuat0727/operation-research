import itertools
from gurobipy import *
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

def fix_RE_courses(RE, start, end, happiness, front):
	m = Model("fix_RE_courses")
	
	choose = m.addVars(RE, vtype=GRB.BINARY, name="choose")
	m.update()
	
	m.setObjective(quicksum(happiness[c] * choose[c] for c in RE), GRB.MAXIMIZE)
	
	# required courses must be selected
	m.addConstrs(choose[c] == 1 for c in RE if front[c] == 'R')
	
	# avoid collision 
	m.addConstrs(quicksum(choose[c] for c in RE if start[c] <= t <= end[c]) <= 1 for t in range(total_t)) # avoid more than one courses at [t, t+1)
	
	m.optimize()
	
	m.write("fix_RE_courses.lp")
	return m.getAttr('x', choose), m.objVal

def find_best_schedule(RE_selected, A1, A9, start, end, happiness, front):
	m = Model("find_best_schedule")
	A1A9 = A1 + A9
	
	choose = m.addVars(A1A9, vtype=GRB.BINARY, name="choose")
	
	m.update()
	
	m.setObjective(quicksum(happiness[c] * choose[c] for c in A1A9), GRB.MAXIMIZE)
	
	# avoid collision between A1A9 and RE
	m.addConstrs(choose[c] == 0 for c in A1A9 if not all(start[c] > end[cRE] or end[c] < start[cRE] for cRE in RE_selected))

	# avoid collision in A1A9
	m.addConstrs(quicksum(choose[c] for c in A1A9 if start[c] <= t <= end[c]) <= 1 for t in range(total_t))
	
	# at most one A1
	m.addConstr(quicksum(choose[c] for c in course if front[c] == 'A1') <= 1)

	# at most three A9
	m.addConstr(quicksum(choose[c] for c in course if front[c] == 'A9') <= 3)

	m.optimize()
	
	m.write("find_best_schedule.lp")
	return m.getAttr('x', choose), m.objVal

def find_best_order(RE_selected, A1, A9, start, end, happiness, front):
	collide = [[],[]]
	for cA1 in A1:
		collideA9 = [cA9 for cA9 in A9 if (start[cA1] > end[cA9] or end[cA1] < start[cA9]) == False]
		if collideA9: # if len(collideA9) > 0
			collide[0].append(cA1)
			collide[1].append(collideA9)
	
	m = Model("find_best_order")
	
	choose_A1 = m.addVars(A1, len(A1), vtype=GRB.BINARY, name="choose_A1")
	choose_A9 = m.addVars(A9, len(A9), vtype=GRB.BINARY, name="choose_A9")
	
	m.update()
	
	p_A1 = 0.1
	prob_A1 = [p_A1 * ((1-p_A1)**i) for i in range(len(A1))]
	
	p_A9 = 0.5
	prob_A9 = [p_A9 * ((1-p_A9)**i) for i in range(len(A9))]
	
	m.setObjective(
			# calculate ideal value of happiness of A1 courses(if collide with RE, value = 0. Not consider about collision between A1A9)
		   	quicksum(prob_A1[i] * choose_A1[c, i] * happiness[c] for c in A1 for i in range(len(A1)) if all(start[c] > end[cRE] or end[c] < start[cRE] for cRE in RE_selected))
			# calculate ideal value of happiness of A9 courses(if collide with RE, value = 0. Not consider about collision between A1A9)
		   	+ quicksum(prob_A9[i] * choose_A9[c, i] * happiness[c] for c in A9 for i in range(len(A9)) if all(start[c] > end[cRE] or end[c] < start[cRE] for cRE in RE_selected))
			# subtract the ideal value that added twice(collision between A1A9)
			- quicksum(prob_A1[i] * choose_A1[cA1, i] * prob_A9[j] * choose_A9[cA9, j] * min(happiness[cA9], happiness[cA1]) for cA1, cA9s in zip(collide[0], collide[1]) for cA9 in cA9s for i in range(len(A1)) for j in range(len(A9)))
			,GRB.MAXIMIZE)
	
	# assignment problem
	# 序序有課填
	m.addConstrs(choose_A1.sum(c, '*') == 1 for c in A1)
	# 課課有序選
	m.addConstrs(choose_A1.sum('*', i) == 1 for i in range(len(A1)))
	# 序序有課填
	m.addConstrs(choose_A9.sum(c, '*') == 1 for c in A9)
	# 課課有序選
	m.addConstrs(choose_A9.sum('*', i) == 1 for i in range(len(A9)))
			
	m.optimize()
	
	m.write("find_best_order.lp")
	return m.getAttr('x', choose_A1), m.getAttr('x', choose_A9), m.objVal

def print_result(RE, A1, A9, sel_RE, sel_A1A9, order_A1, order_A9, happy_RE, happy_A1A9, happy_order, day, start, end, happiness, front):
	xingQi = ['Monday', 'Tuesday', 'Wednesday', 'Thusday', 'Friday']
	colors = {'R':'lightblue', 'E':'lightgreen', 'A1':'salmon', 'A9':'wheat'}
	times = {x:x+7 if x <= 4 else x+8 for x in range(1, 1+one_t, 1)}

	fig = plt.figure(figsize=(10, 10))
	for c in [c for c in RE if sel_RE[c] > 0.99]+[c for c in A1+A9 if sel_A1A9[c] > 0.99]:
		plt.fill_between([day[c]-0.48, day[c]+0.48], [times[start[c]]+0.02, times[start[c]]+0.02], [times[end[c]]+0.98, times[end[c]]+0.98], color=colors[front[c]], edgecolor='k', linewidth=0.5)
		plt.text(day[c], (times[start[c]]+times[end[c]]+1)/2, '{}\nhappiness = {}'.format(c, happiness[c]), ha='center', va='center', fontsize=8)

	A1_order = 'Foreign Language Courses\ndraw order:\n(order:course -- happiness)\n\n'
	for i, c in itertools.product(range(len(A1)), A1):
		if order_A1[c, i] > 0.99:
			A1_order += '{:2d}: {} -- {}\n'.format(i+1, c, happiness[c])
	A9_order = 'General Education Courses\ndraw order:\n(order:course -- happiness)\n\n'
	for i, c in itertools.product(range(len(A9)), A9):
		if order_A9[c, i] > 0.99:
			A9_order += '{:2d}: {:25s} -- {}\n'.format(i+1, c, happiness[c])

	ax = fig.add_subplot(111)
	# ax.yaxis.grid()
	ax.set_xlim(0.5, 5.5)
	ax.set_ylim(20, 8)
	ax.set_xticks(range(1, 6, 1))
	ax.set_xticklabels(xingQi)
	ax.set_xlabel('\nBest value of happiness:  {}\nIdeal value of happiness after first stage:  {:.3f}'.format(happy_RE+happy_A1A9, happy_RE+happy_order), fontsize=15)
	ax2 = ax.twiny().twinx()
	ax2.set_xlim(ax.get_xlim())
	ax2.set_ylim(ax.get_ylim())
	ax2.set_xticks(ax.get_xticks())
	ax2.set_xticklabels(ax.get_xticklabels())
	plt.text(-1.8, 12, A1_order, fontsize=12)
	plt.text(-1.8, 19, A9_order, fontsize=12)
	plt.subplots_adjust(left=0.3)
	plt.title("Best courses timetable and Best draw order for first stage\n\n\n")
	plt.show()
	
	'''
	fig = plt.figure(figsize=(10, 10))
	for i, c in itertools.product(range(len(A1)), A1):
		if sol_A1[c, i] == 1:
			plt.gca().add_patch(Rectangle((day[c]-0.5, times[start[c]]), 1, end[c]-start[c]+1, fill=None, alpha=1))
			plt.text(day[c], times[start[c]]+0.1, '{}\norder:{}  p:{:.1%}  hp:{}\nideal hp:{:.4f}'.format(c,i+1,prob_A1[i], happiness[c], prob_A1[i]*happiness[c]), ha='center', va='top', fontsize=8)
	for i, c in itertools.product(range(len(A9)), A9):
		if sol_A9[c, i] == 1:
			plt.gca().add_patch(Rectangle((day[c]-0.5, times[start[c]]), 1, end[c]-start[c]+1, fill=None, alpha=1))
			plt.text(day[c], times[end[c]]+0.9, '{}\norder:{}  p:{:.1%}  hp:{}\nideal hp:{:.4f}'.format(c,i+1,prob_A9[i], happiness[c], prob_A9[i]*happiness[c]), ha='center', va='bottom', fontsize=8)
	
	ax = fig.add_subplot(111)
	ax.set_xlim(0.5, 5.5)
	ax.set_ylim(20, 8)
	ax.set_xticks(range(1, 6, 1))
	ax.set_xticklabels(xingQi)
	ax.set_xlabel('\nIdeal value of happiness:  {:.3f}'.format(m.objVal), fontsize=15)
	
	ax2 = ax.twiny().twinx()
	ax2.set_xlim(ax.get_xlim())
	ax2.set_ylim(ax.get_ylim())
	ax2.set_xticks(ax.get_xticks())
	ax2.set_xticklabels(ax.get_xticklabels())
	
	plt.show()
	'''

# read courses from input.txt
dicts = {}
with open('input.txt', 'r') as f:
	f.readline()
	for line in f.readlines():
		datas = line.split()
		for i in range(1, 5, 1):
			datas[i] = int(datas[i])
		dicts[datas[0]] = datas[1:]
course,day,start,end,happiness,front = multidict(dicts)

# total period of one day
one_t = 12
total_t = 5 * one_t

for c in course:
	start[c] = (day[c]-1) * one_t + start[c]
	end[c] = (day[c]-1) * one_t + end[c]

# create lists for different type of courses
RE = [c for c in course if front[c] == 'R' or front[c] == 'E']
A1 = [c for c in course if front[c] == 'A1']
A9 = [c for c in course if front[c] == 'A9']

# Fisrt, fix required and elective courses
sel_RE, happy_RE = fix_RE_courses(RE, start, end, happiness, front)
RE_selected = [c for c in RE if sel_RE[c] == 1]

# Then, find best schedule
sel_A1A9, happy_A1A9 = find_best_schedule(RE_selected, A1, A9, start, end, happiness, front)

# Lastly, find best order
order_A1, order_A9, happy_order = find_best_order(RE_selected, A1, A9, start, end, happiness, front)

for c in course:
	start[c] %= one_t
	end[c] %= one_t

print_result(RE, A1, A9, sel_RE, sel_A1A9, order_A1, order_A9, happy_RE, happy_A1A9, happy_order, day, start, end, happiness, front)
