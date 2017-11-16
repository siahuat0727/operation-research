import itertools
from gurobipy import *
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

# course,day,start,end,happiness,front=multidict({
# 		('compiler'):[5,2,4,5,'R'],
# 		('programming_language'):[1,5,7,8,'R'],
# 		('user_interface'):[3,7,9,5,'E'],
# 		('japan4178B'):[1,7,8,4,'A1'],
# 		('japan4178C'):[1,7,8,4,'A1'],
# 		('japan4234A'):[2,3,4,4,'A1'],
# 		('japan4278A'):[2,7,8,4,'A1'],
# 		('japan4356B'):[3,5,6,4,'A1'],
# 		('japan4378A'):[3,7,8,4,'A1'],
# 		('japan4434A'):[4,3,4,4,'A1'],
# 		('japan4456C'):[4,5,6,4,'A1'],
# 		('japan4534A'):[5,3,4,4,'A1'],
# 		('japan4578A'):[5,7,8,4,'A1']
# 		})

course,day,start,end,happiness,front=multidict({
		('JapaneseA'):[1,7,8,8,'A1'],
		('JapaneseB'):[2,3,4,6,'A1'],
		('JapaneseC'):[2,7,8,4,'A1'],
		('GeneralEducationA'):[1,7,8,10,'A9'],
		('GeneralEducationB'):[2,7,8,5,'A9'],
		('GeneralEducationC'):[5,7,8,2,'A9'],
		})

# total period of one day
one_t = 12
total_t = 5 * one_t

for c in course:
	start[c] = (day[c]-1) * one_t + start[c]
	end[c] = (day[c]-1) * one_t + end[c]

# create lists for different type of courses
A1 = [c for c in course if front[c] == 'A1']
A9 = [c for c in course if front[c] == 'A9']
RE = [c for c in course if front[c] != 'A1' and front[c] != 'A9']
collide = [[],[]]
for cA1 in A1:
	collideA9 = [cA9 for cA9 in A9 if (start[cA1] > end[cA9] or end[cA1] < start[cA9]) == False]
	if collideA9: # if len(collideA9) > 0
		collide[0].append(cA1)
		collide[1].append(collideA9)

m = Model("course_schedule")

choose_RE = m.addVars(RE, vtype=GRB.BINARY, name="choose_RE")
choose_A1 = m.addVars(A1, len(A1), vtype=GRB.BINARY, name="choose_A1")
choose_A9 = m.addVars(A9, len(A9), vtype=GRB.BINARY, name="choose_A9")

m.update()

p_A1 = 0.1
prob_A1 = [p_A1 * ((1-p_A1)**i) for i in range(len(A1))]

p_A9 = 0.24
prob_A9 = [p_A9 * ((1-p_A9)**i) for i in range(len(A9))]

m.setObjective(
		# calculate happiness of required and elective courses
		quicksum(happiness[c] * choose_RE[c] for c in RE)
		# calculate ideal value of happiness of A1 courses(if collide with RE, value = 0, not consider about collision between A1A9)
	   	+ quicksum(prob_A1[i] * choose_A1[c, i] * happiness[c] for c in A1 for i in range(len(A1)) if all(start[c] > end[cc] or end[c] < start[cc] for cc in [c for c in RE if choose_RE[c] == 1]))
		# calculate ideal value of happiness of A9 courses(if collide with RE, value = 0, not consider about collision between A1A9)
	   	+ quicksum(prob_A9[i] * choose_A9[c, i] * happiness[c] for c in A9 for i in range(len(A9)) if all(start[c] > end[cc] or end[c] < start[cc] for cc in [c for c in RE if choose_RE[c] == 1]))
		# subtract the ideal value that added twice(A1 collide with A9)
		- quicksum(prob_A1[i] * choose_A1[cA1, i] * prob_A9[j] * choose_A9[cA9, j] * min(happiness[cA9], happiness[cA1]) for cA1, cA9s in zip(collide[0], collide[1]) for cA9 in cA9s for i in range(len(A1)) for j in range(len(A9)))
		,GRB.MAXIMIZE)

# required courses must be selected
m.addConstrs(choose_RE[c] == 1 for c in RE if front[c] == 'R')

# avoid collision on required and elective courses
m.addConstrs(quicksum(choose_RE[c] for c in RE if start[c] <= t <= end[c]) <= 1 for t in range(total_t)) # avoid more than one courses at [t, t+1)

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

m.write("course_schedule.lp")
sol_RE = m.getAttr('x', choose_RE)
print("choose_RE:")
print(sol_RE)
sol_A1 = m.getAttr('x', choose_A1)
for i, c in itertools.product(range(len(A1)), A1):
	if sol_A1[c, i] == 1:
		print(i+1,":",c)
sol_A9 = m.getAttr('x', choose_A9)
for i, c in itertools.product(range(len(A9)), A9):
	if sol_A9[c, i] == 1:
		print(i+1,":",c)

print("happiness value: %g"%m.objVal)

for c in course:
	start[c] %= one_t
	end[c] %= one_t

xingQi = ['Monday', 'Tuseday', 'Wednesday', 'Thusday', 'Friday']
# colors = ['pink', 'lightgreen', 'lightblue', 'wheat', 'salmon']
colors = {'R':'lightblue', 'E':'lightgreen', 'A1':'salmon', 'A9':'wheat'}
times = {x:x+7 if x <= 4 else x+8 for x in range(1, 1+one_t, 1)}
print(times)

fig = plt.figure(figsize=(10, 10))
'''	
for c in RE:
	if(sol_RE[c] == True):
		plt.fill_between([day[c]-0.5, day[c]+0.5], [times[start[c]], times[start[c]]], [times[end[c]]+1, times[end[c]]+1], color=colors[front[c]], edgecolor='k', linewidth=0.5)
		plt.text(day[c], (times[start[c]]+times[end[c]]+1)/2, c, ha='center', va='bottom', fontsize=8)
'''	

for i, c in itertools.product(range(len(A1)), A1):
	if sol_A1[c, i] == 1:
		plt.gca().add_patch(Rectangle((day[c]-0.5, times[start[c]]), 1, end[c]-start[c]+1, fill=None, alpha=1))
		plt.text(day[c], times[start[c]]+0.1, '{}\norder:{}  p:{:.1%}  hp:{}\nideal hp:{:.4f}'.format(c,i+1,prob_A1[i], happiness[c], prob_A1[i]*happiness[c]), ha='center', va='top', fontsize=8)

for i, c in itertools.product(range(len(A9)), A9):
	if sol_A9[c, i] == 1:
		plt.gca().add_patch(Rectangle((day[c]-0.5, times[start[c]]), 1, end[c]-start[c]+1, fill=None, alpha=1))
		plt.text(day[c], times[end[c]]+0.9, '{}\norder:{}  p:{:.1%}  hp:{}\nideal hp:{:.4f}'.format(c,i+1,prob_A9[i], happiness[c], prob_A9[i]*happiness[c]), ha='center', va='bottom', fontsize=8)

ax = fig.add_subplot(111)
# ax.yaxis.grid()
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
