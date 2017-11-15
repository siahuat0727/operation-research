\ Model course_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  5 choose_notA1A9[compiler] + 5 choose_notA1A9[programming_language]
   + 0.3 choose_A1[japan4234A,0] + 0.27 choose_A1[japan4234A,1]
   + 0.243 choose_A1[japan4234A,2] + 0.2187 choose_A1[japan4234A,3]
   + 0.19683 choose_A1[japan4234A,4] + 0.1 choose_A1[japan4178B,0]
   + 0.09 choose_A1[japan4178B,1] + 0.081 choose_A1[japan4178B,2]
   + 0.0729 choose_A1[japan4178B,3] + 0.06561 choose_A1[japan4178B,4]
   + 0.2 choose_A1[japan4178C,0] + 0.18 choose_A1[japan4178C,1]
   + 0.162 choose_A1[japan4178C,2] + 0.1458 choose_A1[japan4178C,3]
   + 0.13122 choose_A1[japan4178C,4] + 0.4 choose_A1[japan4278A,0]
   + 0.36 choose_A1[japan4278A,1] + 0.324 choose_A1[japan4278A,2]
   + 0.2916 choose_A1[japan4278A,3] + 0.26244 choose_A1[japan4278A,4]
   + 2.5 choose_A9[tongshi278,0] + [
   - 0.5 choose_A1[japan4356B,0] * choose_A9[tongshi278,0]
   - 0.45 choose_A1[japan4356B,1] * choose_A9[tongshi278,0]
   - 0.405 choose_A1[japan4356B,2] * choose_A9[tongshi278,0]
   - 0.3645 choose_A1[japan4356B,3] * choose_A9[tongshi278,0]
   - 0.32805 choose_A1[japan4356B,4] * choose_A9[tongshi278,0] ] / 2 
Subject To
 R0: <= 1
 R1: <= 1
 R2: <= 1
 R3: <= 1
 R4: <= 1
 R5: choose_notA1A9[programming_language] <= 1
 R6: choose_notA1A9[programming_language] <= 1
 R7: <= 1
 R8: <= 1
 R9: <= 1
 R10: <= 1
 R11: <= 1
 R12: <= 1
 R13: <= 1
 R14: <= 1
 R15: <= 1
 R16: <= 1
 R17: <= 1
 R18: <= 1
 R19: <= 1
 R20: <= 1
 R21: <= 1
 R22: <= 1
 R23: <= 1
 R24: <= 1
 R25: <= 1
 R26: <= 1
 R27: <= 1
 R28: <= 1
 R29: <= 1
 R30: <= 1
 R31: <= 1
 R32: <= 1
 R33: <= 1
 R34: <= 1
 R35: <= 1
 R36: <= 1
 R37: <= 1
 R38: <= 1
 R39: <= 1
 R40: <= 1
 R41: <= 1
 R42: <= 1
 R43: <= 1
 R44: <= 1
 R45: <= 1
 R46: <= 1
 R47: <= 1
 R48: <= 1
 R49: <= 1
 R50: choose_notA1A9[compiler] <= 1
 R51: choose_notA1A9[compiler] <= 1
 R52: <= 1
 R53: <= 1
 R54: <= 1
 R55: <= 1
 R56: <= 1
 R57: <= 1
 R58: <= 1
 R59: <= 1
 R60: choose_A1[japan4234A,0] + choose_A1[japan4178B,0]
   + choose_A1[japan4356B,0] + choose_A1[japan4178C,0]
   + choose_A1[japan4278A,0] = 1
 R61: choose_A1[japan4234A,1] + choose_A1[japan4178B,1]
   + choose_A1[japan4356B,1] + choose_A1[japan4178C,1]
   + choose_A1[japan4278A,1] = 1
 R62: choose_A1[japan4234A,2] + choose_A1[japan4178B,2]
   + choose_A1[japan4356B,2] + choose_A1[japan4178C,2]
   + choose_A1[japan4278A,2] = 1
 R63: choose_A1[japan4234A,3] + choose_A1[japan4178B,3]
   + choose_A1[japan4356B,3] + choose_A1[japan4178C,3]
   + choose_A1[japan4278A,3] = 1
 R64: choose_A1[japan4234A,4] + choose_A1[japan4178B,4]
   + choose_A1[japan4356B,4] + choose_A1[japan4178C,4]
   + choose_A1[japan4278A,4] = 1
 R65: choose_A1[japan4234A,0] + choose_A1[japan4234A,1]
   + choose_A1[japan4234A,2] + choose_A1[japan4234A,3]
   + choose_A1[japan4234A,4] = 1
 R66: choose_A1[japan4178B,0] + choose_A1[japan4178B,1]
   + choose_A1[japan4178B,2] + choose_A1[japan4178B,3]
   + choose_A1[japan4178B,4] = 1
 R67: choose_A1[japan4356B,0] + choose_A1[japan4356B,1]
   + choose_A1[japan4356B,2] + choose_A1[japan4356B,3]
   + choose_A1[japan4356B,4] = 1
 R68: choose_A1[japan4178C,0] + choose_A1[japan4178C,1]
   + choose_A1[japan4178C,2] + choose_A1[japan4178C,3]
   + choose_A1[japan4178C,4] = 1
 R69: choose_A1[japan4278A,0] + choose_A1[japan4278A,1]
   + choose_A1[japan4278A,2] + choose_A1[japan4278A,3]
   + choose_A1[japan4278A,4] = 1
 R70: choose_A9[tongshi278,0] = 1
 R71: choose_A9[tongshi278,0] = 1
Bounds
Binaries
 choose_notA1A9[compiler] choose_notA1A9[programming_language]
 choose_A1[japan4234A,0] choose_A1[japan4234A,1] choose_A1[japan4234A,2]
 choose_A1[japan4234A,3] choose_A1[japan4234A,4] choose_A1[japan4178B,0]
 choose_A1[japan4178B,1] choose_A1[japan4178B,2] choose_A1[japan4178B,3]
 choose_A1[japan4178B,4] choose_A1[japan4356B,0] choose_A1[japan4356B,1]
 choose_A1[japan4356B,2] choose_A1[japan4356B,3] choose_A1[japan4356B,4]
 choose_A1[japan4178C,0] choose_A1[japan4178C,1] choose_A1[japan4178C,2]
 choose_A1[japan4178C,3] choose_A1[japan4178C,4] choose_A1[japan4278A,0]
 choose_A1[japan4278A,1] choose_A1[japan4278A,2] choose_A1[japan4278A,3]
 choose_A1[japan4278A,4] choose_A9[tongshi278,0]
End
