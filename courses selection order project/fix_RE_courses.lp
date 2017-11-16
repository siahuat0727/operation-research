\ Model fix_RE_courses
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  5 choose[compiler] + 8 choose[programming_language]
   + 5 choose[user_interface] + 8 choose[jserf]
   + 15 choose[TheMindOfTheStrategist] + 9 choose[ACM]
   + 6 choose[RealTimeSystem]
Subject To
 R0: choose[compiler] = 1
 R1: choose[programming_language] = 1
 R2: <= 1
 R3: <= 1
 R4: <= 1
 R5: <= 1
 R6: <= 1
 R7: choose[programming_language] <= 1
 R8: choose[programming_language] <= 1
 R9: choose[programming_language] <= 1
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
 R20: choose[TheMindOfTheStrategist] <= 1
 R21: choose[jserf] + choose[TheMindOfTheStrategist] <= 1
 R22: choose[jserf] + choose[TheMindOfTheStrategist] <= 1
 R23: choose[jserf] <= 1
 R24: <= 1
 R25: <= 1
 R26: <= 1
 R27: <= 1
 R28: choose[RealTimeSystem] <= 1
 R29: choose[RealTimeSystem] <= 1
 R30: choose[RealTimeSystem] <= 1
 R31: <= 1
 R32: <= 1
 R33: choose[user_interface] <= 1
 R34: choose[user_interface] <= 1
 R35: choose[user_interface] + choose[ACM] <= 1
 R36: choose[ACM] <= 1
 R37: choose[ACM] <= 1
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
 R52: choose[compiler] <= 1
 R53: choose[compiler] <= 1
 R54: choose[compiler] <= 1
 R55: <= 1
 R56: <= 1
 R57: <= 1
 R58: <= 1
 R59: <= 1
 R60: <= 1
 R61: <= 1
Bounds
Binaries
 choose[compiler] choose[programming_language] choose[user_interface]
 choose[jserf] choose[TheMindOfTheStrategist] choose[ACM]
 choose[RealTimeSystem]
End
