from gurobipy import *

c = [2, 3]
d = [1, 0]

print(sum(c[i]*d[i] for i in range(2)))
print(quicksum(c[i] for i in range(2) if d[i] == 1))


