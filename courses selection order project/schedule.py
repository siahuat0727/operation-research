import itertools
from gurobipy import *

# course,day,start,end,happiness,front=multidict({
# 		('compiler'):[5,2,4,5,'F7'],
# 		('programming_language'):[1,5,7,8,'F7'],
# 		('blabla'):[1,6,9,6,'F7'],
# 		('user_interface'):[3,7,9,5,'EE'],
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
		('compiler'):[5,2,4,5,'F7'],
		('programming_language'):[1,5,7,5,'F7'],
		('japan4178B'):[1,7,8,1,'A1'],
		('japan4178C'):[1,7,8,2,'A1'],
		('japan4234A'):[2,3,4,3,'A1'],
		('japan4278A'):[2,7,8,4,'A1'],
		('japan4356B'):[5,2,4,5,'A1'],
		})

# create lists for different type of courses
A1 = [c for c in course if front[c] == 'A1']
A9 = [c for c in course if front[c] == 'A9']
notA1A9 = [c for c in course if front[c] != 'A1' and front[c] != 'A9']

# total period of one day
one_t = 12
total_t = 5 * one_t

for c in course:
	start[c] = (day[c]-1) * one_t + start[c]
	end[c] = (day[c]-1) * one_t + end[c]

m = Model("course_schedule")

choose_notA1A9 = m.addVars(notA1A9, vtype=GRB.BINARY, name="choose_notA1A9")
choose_A1 = m.addVars(A1, len(A1), vtype=GRB.BINARY, name="choose_A1")
choose_A9 = m.addVars(A9, len(A9), vtype=GRB.BINARY, name="choose_A9")

m.update()

p_A1 = 0.1
prob_A1 = [p_A1 * ((1-p_A1)**i) for i in range(len(A1))]

p_A9 = 0.5
prob_A9 = [p_A9 * ((1-p_A9)**i) for i in range(len(A9))]

m.setObjective(
		# calculate happiness of required and elective courses
		quicksum(happiness[c] * choose_notA1A9[c] for c in notA1A9)
		# calculate ideal value of happiness of A1 courses(if collide with notA1A9, value = 0, not consider about collision between A1A9)
	   	+ quicksum(prob_A1[i] * choose_A1[c, i] * happiness[c] for c in A1 for i in range(len(A1)) if all(start[c] >= end[cc] or end[c] <= start[cc] for cc in [c for c in notA1A9 if choose_notA1A9[c] == 1]))
		# calculate ideal value of happiness of A9 courses(if collide with notA1A9, value = 0, not consider about collision between A1A9)
	   	+ quicksum(prob_A9[i] * choose_A9[c, i] * happiness[c] for c in A9 for i in range(len(A9)) if all(start[c] >= end[cc] or end[c] <= start[cc] for cc in [c for c in notA1A9 if choose_notA1A9[c] == 1]))
		,GRB.MAXIMIZE)
# avoid collision on required and elective courses
for t in range(total_t):
	m.addConstr(quicksum(choose_notA1A9[c] for c in notA1A9 if start[c] <= t < end[c]) <= 1)

# each order has exactly one A1 course 
m.addConstrs(choose_A1.sum('*', i) == 1 for i in range(len(A1)))
# each A1 course must be filled in exactly one order
m.addConstrs(choose_A1.sum(c, '*') == 1 for c in A1)
		
# each order has exactly one A9 course 
m.addConstrs(choose_A9.sum('*', i) == 1 for i in range(len(A9)))
# each A9 course must be filled in exactly one order
m.addConstrs(choose_A9.sum(c, '*') == 1 for c in A9)
		
m.optimize()

m.write("course_schedule.lp")

sol_notA1A9 = m.getAttr('x', choose_notA1A9)
print("choose_notA1A9:")
print(sol_notA1A9)
sol_A1 = m.getAttr('x', choose_A1)
for i, c in itertools.product(range(len(A1)), A1):
	if sol_A1[c, i] == 1:
		print(i+1,":",c)

print("happiness value: %g"%m.objVal)
