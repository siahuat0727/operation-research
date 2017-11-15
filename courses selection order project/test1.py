import itertools
from gurobipy import *

course,day,start,end,happiness,front=multidict({
		('compiler'):[5,2,4,5,'F7'],
		('programming_language'):[5,2,4,6,'F7'],
		})

notA1A9 = [c for c in course if front[c] != 'A1' and front[c] != 'A9']

m = Model("course_schedule")

choose_notA1A9 = m.addVars(notA1A9, vtype=GRB.BINARY, name="choose_notA1A9")

m.update()

m.setObjective(
		# calculate happiness of required and elective courses
		quicksum(happiness[c] * choose_notA1A9[c] for c in notA1A9)
		,GRB.MAXIMIZE)

m.addConstr(choose_notA1A9.sum('*') <= 1)

m.optimize()

m.write("course_schedule1.lp")
