\ Model course_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  + 11 Constant
Subject To
 R0: choose_notA1A9[compiler] + choose_notA1A9[programming_language] <= 1
Bounds
 Constant = 1
Binaries
 choose_notA1A9[compiler] choose_notA1A9[programming_language]
End
