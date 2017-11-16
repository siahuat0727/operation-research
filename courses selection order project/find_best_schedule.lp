\ Model find_best_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  9 choose[japan4_1[7-8]B] + 5 choose[japan4_1[7-8]C]
   + 7 choose[japan4_2[3-4]A] + 5 choose[japan4_2[7-8]A]
   + 5 choose[japan4_3[5-6]B] + 6 choose[japan4_3[7-8]A]
   + 7 choose[japan4_4[3-4]A] + 5 choose[japan4_4[5-6]C]
   + 4 choose[japan4_5[3-4]A] + 5 choose[japan4_5[7-8]A]
   + 6 choose[SmartGreenLife_3[3-4]] + 5 choose[TheArtOfDecision_3[3-4]]
   + 2 choose[ExerciseAndHealth_3[3-4]] + 4 choose[Psycology_4[3-4]]
   + 3 choose[OutlineOfLaw_4[8-9]] + 3 choose[OutlineOfLaw_5[1-2]]
   + 9 choose[GeneCode_4[3-4]] + 4 choose[DramaAndFilm_3[5-6]]
   + 7 choose[HelloArt_3[5-6]] + 3 choose[Ethics_2[5-6]]
   + 4 choose[StatisticsAndLife_2[5-6]]
Subject To
 R0: choose[japan4_1[7-8]B] = 0
 R1: choose[japan4_1[7-8]C] = 0
 R2: choose[japan4_2[7-8]A] = 0
 R3: choose[japan4_5[3-4]A] = 0
 R4: choose[SmartGreenLife_3[3-4]] = 0
 R5: choose[TheArtOfDecision_3[3-4]] = 0
 R6: choose[ExerciseAndHealth_3[3-4]] = 0
 R7: choose[OutlineOfLaw_5[1-2]] = 0
 R8: choose[Ethics_2[5-6]] = 0
 R9: choose[StatisticsAndLife_2[5-6]] = 0
 R10: <= 1
 R11: <= 1
 R12: <= 1
 R13: <= 1
 R14: <= 1
 R15: <= 1
 R16: <= 1
 R17: choose[japan4_1[7-8]B] + choose[japan4_1[7-8]C] <= 1
 R18: choose[japan4_1[7-8]B] + choose[japan4_1[7-8]C] <= 1
 R19: <= 1
 R20: <= 1
 R21: <= 1
 R22: <= 1
 R23: <= 1
 R24: <= 1
 R25: choose[japan4_2[3-4]A] <= 1
 R26: choose[japan4_2[3-4]A] <= 1
 R27: choose[Ethics_2[5-6]] + choose[StatisticsAndLife_2[5-6]] <= 1
 R28: choose[Ethics_2[5-6]] + choose[StatisticsAndLife_2[5-6]] <= 1
 R29: choose[japan4_2[7-8]A] <= 1
 R30: choose[japan4_2[7-8]A] <= 1
 R31: <= 1
 R32: <= 1
 R33: <= 1
 R34: <= 1
 R35: <= 1
 R36: <= 1
 R37: choose[SmartGreenLife_3[3-4]] + choose[TheArtOfDecision_3[3-4]]
   + choose[ExerciseAndHealth_3[3-4]] <= 1
 R38: choose[SmartGreenLife_3[3-4]] + choose[TheArtOfDecision_3[3-4]]
   + choose[ExerciseAndHealth_3[3-4]] <= 1
 R39: choose[japan4_3[5-6]B] + choose[DramaAndFilm_3[5-6]]
   + choose[HelloArt_3[5-6]] <= 1
 R40: choose[japan4_3[5-6]B] + choose[DramaAndFilm_3[5-6]]
   + choose[HelloArt_3[5-6]] <= 1
 R41: choose[japan4_3[7-8]A] <= 1
 R42: choose[japan4_3[7-8]A] <= 1
 R43: <= 1
 R44: <= 1
 R45: <= 1
 R46: <= 1
 R47: <= 1
 R48: <= 1
 R49: choose[japan4_4[3-4]A] + choose[Psycology_4[3-4]]
   + choose[GeneCode_4[3-4]] <= 1
 R50: choose[japan4_4[3-4]A] + choose[Psycology_4[3-4]]
   + choose[GeneCode_4[3-4]] <= 1
 R51: choose[japan4_4[5-6]C] <= 1
 R52: choose[japan4_4[5-6]C] <= 1
 R53: <= 1
 R54: <= 1
 R55: <= 1
 R56: <= 1
 R57: <= 1
 R58: <= 1
 R59: choose[OutlineOfLaw_5[1-2]] <= 1
 R60: choose[OutlineOfLaw_5[1-2]] <= 1
 R61: choose[japan4_5[3-4]A] <= 1
 R62: choose[japan4_5[3-4]A] <= 1
 R63: <= 1
 R64: <= 1
 R65: choose[japan4_5[7-8]A] <= 1
 R66: choose[japan4_5[7-8]A] <= 1
 R67: <= 1
 R68: <= 1
 R69: <= 1
 R70: choose[japan4_1[7-8]B] + choose[japan4_1[7-8]C]
   + choose[japan4_2[3-4]A] + choose[japan4_2[7-8]A]
   + choose[japan4_3[5-6]B] + choose[japan4_3[7-8]A]
   + choose[japan4_4[3-4]A] + choose[japan4_4[5-6]C]
   + choose[japan4_5[3-4]A] + choose[japan4_5[7-8]A] <= 1
 R71: choose[SmartGreenLife_3[3-4]] + choose[TheArtOfDecision_3[3-4]]
   + choose[ExerciseAndHealth_3[3-4]] + choose[Psycology_4[3-4]]
   + choose[OutlineOfLaw_4[8-9]] + choose[OutlineOfLaw_5[1-2]]
   + choose[GeneCode_4[3-4]] + choose[DramaAndFilm_3[5-6]]
   + choose[HelloArt_3[5-6]] + choose[Ethics_2[5-6]]
   + choose[StatisticsAndLife_2[5-6]] <= 3
Bounds
Binaries
 choose[japan4_1[7-8]B] choose[japan4_1[7-8]C] choose[japan4_2[3-4]A]
 choose[japan4_2[7-8]A] choose[japan4_3[5-6]B] choose[japan4_3[7-8]A]
 choose[japan4_4[3-4]A] choose[japan4_4[5-6]C] choose[japan4_5[3-4]A]
 choose[japan4_5[7-8]A] choose[SmartGreenLife_3[3-4]]
 choose[TheArtOfDecision_3[3-4]] choose[ExerciseAndHealth_3[3-4]]
 choose[Psycology_4[3-4]] choose[OutlineOfLaw_4[8-9]]
 choose[OutlineOfLaw_5[1-2]] choose[GeneCode_4[3-4]]
 choose[DramaAndFilm_3[5-6]] choose[HelloArt_3[5-6]] choose[Ethics_2[5-6]]
 choose[StatisticsAndLife_2[5-6]]
End
