\ Model course_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  0.8 choose_A1[JapaneseA,0] + 0.72 choose_A1[JapaneseA,1]
   + 0.648 choose_A1[JapaneseA,2] + 0.6 choose_A1[JapaneseB,0]
   + 0.54 choose_A1[JapaneseB,1] + 0.486 choose_A1[JapaneseB,2]
   + 0.4 choose_A1[JapaneseC,0] + 0.36 choose_A1[JapaneseC,1]
   + 0.324 choose_A1[JapaneseC,2] + 10 choose_A9[GeneralEducationA,0]
   + 5 choose_A9[GeneralEducationA,1] + 2.5 choose_A9[GeneralEducationA,2]
   + 2.5 choose_A9[GeneralEducationB,0]
   + 1.25 choose_A9[GeneralEducationB,1]
   + 0.625 choose_A9[GeneralEducationB,2] + choose_A9[GeneralEducationC,0]
   + 0.5 choose_A9[GeneralEducationC,1]
   + 0.25 choose_A9[GeneralEducationC,2]
   + 0 choose_collide[JapaneseA,0,GeneralEducationA,0]
   + 0 choose_collide[JapaneseA,0,GeneralEducationA,1]
   + 0 choose_collide[JapaneseA,0,GeneralEducationA,2]
   + 0 choose_collide[JapaneseA,0,GeneralEducationB,0]
   + 0 choose_collide[JapaneseA,0,GeneralEducationB,1]
   + 0 choose_collide[JapaneseA,0,GeneralEducationB,2]
   + 0 choose_collide[JapaneseA,0,GeneralEducationC,0]
   + 0 choose_collide[JapaneseA,0,GeneralEducationC,1]
   + 0 choose_collide[JapaneseA,0,GeneralEducationC,2]
   + 0 choose_collide[JapaneseA,1,GeneralEducationA,0]
   + 0 choose_collide[JapaneseA,1,GeneralEducationA,1]
   + 0 choose_collide[JapaneseA,1,GeneralEducationA,2]
   + 0 choose_collide[JapaneseA,1,GeneralEducationB,0]
   + 0 choose_collide[JapaneseA,1,GeneralEducationB,1]
   + 0 choose_collide[JapaneseA,1,GeneralEducationB,2]
   + 0 choose_collide[JapaneseA,1,GeneralEducationC,0]
   + 0 choose_collide[JapaneseA,1,GeneralEducationC,1]
   + 0 choose_collide[JapaneseA,1,GeneralEducationC,2]
   + 0 choose_collide[JapaneseA,2,GeneralEducationA,0]
   + 0 choose_collide[JapaneseA,2,GeneralEducationA,1]
   + 0 choose_collide[JapaneseA,2,GeneralEducationA,2]
   + 0 choose_collide[JapaneseA,2,GeneralEducationB,0]
   + 0 choose_collide[JapaneseA,2,GeneralEducationB,1]
   + 0 choose_collide[JapaneseA,2,GeneralEducationB,2]
   + 0 choose_collide[JapaneseA,2,GeneralEducationC,0]
   + 0 choose_collide[JapaneseA,2,GeneralEducationC,1]
   + 0 choose_collide[JapaneseA,2,GeneralEducationC,2]
   + 0 choose_collide[JapaneseB,0,GeneralEducationA,0]
   + 0 choose_collide[JapaneseB,0,GeneralEducationA,1]
   + 0 choose_collide[JapaneseB,0,GeneralEducationA,2]
   + 0 choose_collide[JapaneseB,0,GeneralEducationB,0]
   + 0 choose_collide[JapaneseB,0,GeneralEducationB,1]
   + 0 choose_collide[JapaneseB,0,GeneralEducationB,2]
   + 0 choose_collide[JapaneseB,0,GeneralEducationC,0]
   + 0 choose_collide[JapaneseB,0,GeneralEducationC,1]
   + 0 choose_collide[JapaneseB,0,GeneralEducationC,2]
   + 0 choose_collide[JapaneseB,1,GeneralEducationA,0]
   + 0 choose_collide[JapaneseB,1,GeneralEducationA,1]
   + 0 choose_collide[JapaneseB,1,GeneralEducationA,2]
   + 0 choose_collide[JapaneseB,1,GeneralEducationB,0]
   + 0 choose_collide[JapaneseB,1,GeneralEducationB,1]
   + 0 choose_collide[JapaneseB,1,GeneralEducationB,2]
   + 0 choose_collide[JapaneseB,1,GeneralEducationC,0]
   + 0 choose_collide[JapaneseB,1,GeneralEducationC,1]
   + 0 choose_collide[JapaneseB,1,GeneralEducationC,2]
   + 0 choose_collide[JapaneseB,2,GeneralEducationA,0]
   + 0 choose_collide[JapaneseB,2,GeneralEducationA,1]
   + 0 choose_collide[JapaneseB,2,GeneralEducationA,2]
   + 0 choose_collide[JapaneseB,2,GeneralEducationB,0]
   + 0 choose_collide[JapaneseB,2,GeneralEducationB,1]
   + 0 choose_collide[JapaneseB,2,GeneralEducationB,2]
   + 0 choose_collide[JapaneseB,2,GeneralEducationC,0]
   + 0 choose_collide[JapaneseB,2,GeneralEducationC,1]
   + 0 choose_collide[JapaneseB,2,GeneralEducationC,2]
   + 0 choose_collide[JapaneseC,0,GeneralEducationA,0]
   + 0 choose_collide[JapaneseC,0,GeneralEducationA,1]
   + 0 choose_collide[JapaneseC,0,GeneralEducationA,2]
   + 0 choose_collide[JapaneseC,0,GeneralEducationB,0]
   + 0 choose_collide[JapaneseC,0,GeneralEducationB,1]
   + 0 choose_collide[JapaneseC,0,GeneralEducationB,2]
   + 0 choose_collide[JapaneseC,0,GeneralEducationC,0]
   + 0 choose_collide[JapaneseC,0,GeneralEducationC,1]
   + 0 choose_collide[JapaneseC,0,GeneralEducationC,2]
   + 0 choose_collide[JapaneseC,1,GeneralEducationA,0]
   + 0 choose_collide[JapaneseC,1,GeneralEducationA,1]
   + 0 choose_collide[JapaneseC,1,GeneralEducationA,2]
   + 0 choose_collide[JapaneseC,1,GeneralEducationB,0]
   + 0 choose_collide[JapaneseC,1,GeneralEducationB,1]
   + 0 choose_collide[JapaneseC,1,GeneralEducationB,2]
   + 0 choose_collide[JapaneseC,1,GeneralEducationC,0]
   + 0 choose_collide[JapaneseC,1,GeneralEducationC,1]
   + 0 choose_collide[JapaneseC,1,GeneralEducationC,2]
   + 0 choose_collide[JapaneseC,2,GeneralEducationA,0]
   + 0 choose_collide[JapaneseC,2,GeneralEducationA,1]
   + 0 choose_collide[JapaneseC,2,GeneralEducationA,2]
   + 0 choose_collide[JapaneseC,2,GeneralEducationB,0]
   + 0 choose_collide[JapaneseC,2,GeneralEducationB,1]
   + 0 choose_collide[JapaneseC,2,GeneralEducationB,2]
   + 0 choose_collide[JapaneseC,2,GeneralEducationC,0]
   + 0 choose_collide[JapaneseC,2,GeneralEducationC,1]
   + 0 choose_collide[JapaneseC,2,GeneralEducationC,2] + [
   - 0.8 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,0]
   - 0.4 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,1]
   - 0.2 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,2]
   - 0.72 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,0]
   - 0.36 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,1]
   - 0.18 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,2]
   - 0.648 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,0]
   - 0.324 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,1]
   - 0.162 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,2]
   - 0.4 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,0]
   - 0.2 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,1]
   - 0.1 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,2]
   - 0.36 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,0]
   - 0.18 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,1]
   - 0.09 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,2]
   - 0.324 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,0]
   - 0.162 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,1]
   - 0.081 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,2] ] / 2 
Subject To
 R0: <= 1
 R1: <= 1
 R2: <= 1
 R3: <= 1
 R4: <= 1
 R5: <= 1
 R6: <= 1
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
 R50: <= 1
 R51: <= 1
 R52: <= 1
 R53: <= 1
 R54: <= 1
 R55: <= 1
 R56: <= 1
 R57: <= 1
 R58: <= 1
 R59: <= 1
 R60: choose_A1[JapaneseA,0] + choose_A1[JapaneseA,1]
   + choose_A1[JapaneseA,2] = 1
 R61: choose_A1[JapaneseB,0] + choose_A1[JapaneseB,1]
   + choose_A1[JapaneseB,2] = 1
 R62: choose_A1[JapaneseC,0] + choose_A1[JapaneseC,1]
   + choose_A1[JapaneseC,2] = 1
 R63: choose_A1[JapaneseA,0] + choose_A1[JapaneseB,0]
   + choose_A1[JapaneseC,0] = 1
 R64: choose_A1[JapaneseA,1] + choose_A1[JapaneseB,1]
   + choose_A1[JapaneseC,1] = 1
 R65: choose_A1[JapaneseA,2] + choose_A1[JapaneseB,2]
   + choose_A1[JapaneseC,2] = 1
 R66: choose_A9[GeneralEducationA,0] + choose_A9[GeneralEducationA,1]
   + choose_A9[GeneralEducationA,2] = 1
 R67: choose_A9[GeneralEducationB,0] + choose_A9[GeneralEducationB,1]
   + choose_A9[GeneralEducationB,2] = 1
 R68: choose_A9[GeneralEducationC,0] + choose_A9[GeneralEducationC,1]
   + choose_A9[GeneralEducationC,2] = 1
 R69: choose_A9[GeneralEducationA,0] + choose_A9[GeneralEducationB,0]
   + choose_A9[GeneralEducationC,0] = 1
 R70: choose_A9[GeneralEducationA,1] + choose_A9[GeneralEducationB,1]
   + choose_A9[GeneralEducationC,1] = 1
 R71: choose_A9[GeneralEducationA,2] + choose_A9[GeneralEducationB,2]
   + choose_A9[GeneralEducationC,2] = 1
 c_over_add: over_add + [
   - 0.4 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,0]
   - 0.2 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,1]
   - 0.1 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,2]
   - 0.36 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,0]
   - 0.18 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,1]
   - 0.09 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,2]
   - 0.324 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,0]
   - 0.162 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,1]
   - 0.081 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,2]
   - 0.2 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,0]
   - 0.1 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,1]
   - 0.05 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,2]
   - 0.18 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,0]
   - 0.09 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,1]
   - 0.045 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,2]
   - 0.162 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,0]
   - 0.081 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,1]
   - 0.0405 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,2] ] = 0
Bounds
Binaries
 choose_A1[JapaneseA,0] choose_A1[JapaneseA,1] choose_A1[JapaneseA,2]
 choose_A1[JapaneseB,0] choose_A1[JapaneseB,1] choose_A1[JapaneseB,2]
 choose_A1[JapaneseC,0] choose_A1[JapaneseC,1] choose_A1[JapaneseC,2]
 choose_A9[GeneralEducationA,0] choose_A9[GeneralEducationA,1]
 choose_A9[GeneralEducationA,2] choose_A9[GeneralEducationB,0]
 choose_A9[GeneralEducationB,1] choose_A9[GeneralEducationB,2]
 choose_A9[GeneralEducationC,0] choose_A9[GeneralEducationC,1]
 choose_A9[GeneralEducationC,2]
End
