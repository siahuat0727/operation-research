\ Model course_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  0.8 choose_A1[JapaneseA,0] + 0.72 choose_A1[JapaneseA,1]
   + 0.648 choose_A1[JapaneseA,2] + 0.6 choose_A1[JapaneseB,0]
   + 0.54 choose_A1[JapaneseB,1] + 0.486 choose_A1[JapaneseB,2]
   + 0.4 choose_A1[JapaneseC,0] + 0.36 choose_A1[JapaneseC,1]
   + 0.324 choose_A1[JapaneseC,2] + 2.4 choose_A9[GeneralEducationA,0]
   + 1.824 choose_A9[GeneralEducationA,1]
   + 1.38624 choose_A9[GeneralEducationA,2]
   + 1.2 choose_A9[GeneralEducationB,0]
   + 0.912 choose_A9[GeneralEducationB,1]
   + 0.69312 choose_A9[GeneralEducationB,2]
   + 0.48 choose_A9[GeneralEducationC,0]
   + 0.3648 choose_A9[GeneralEducationC,1]
   + 0.277248 choose_A9[GeneralEducationC,2] + [
   - 0.384 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,0]
   - 0.29184 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,1]
   - 0.2217984 choose_A1[JapaneseA,0] * choose_A9[GeneralEducationA,2]
   - 0.3456 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,0]
   - 0.262656 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,1]
   - 0.19961856 choose_A1[JapaneseA,1] * choose_A9[GeneralEducationA,2]
   - 0.31104 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,0]
   - 0.2363904000000001 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,1]
   - 0.179656704 choose_A1[JapaneseA,2] * choose_A9[GeneralEducationA,2]
   - 0.192 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,0]
   - 0.14592 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,1]
   - 0.1108992 choose_A1[JapaneseC,0] * choose_A9[GeneralEducationB,2]
   - 0.1728 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,0]
   - 0.131328 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,1]
   - 0.09980928 choose_A1[JapaneseC,1] * choose_A9[GeneralEducationB,2]
   - 0.15552 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,0]
   - 0.1181952 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,1]
   - 0.089828352 choose_A1[JapaneseC,2] * choose_A9[GeneralEducationB,2]
   ] / 2 
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
