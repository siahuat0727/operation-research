\ Model course_schedule
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  5 choose_notA1A9[compiler] + 6 choose_notA1A9[programming_language]
Subject To
 R0: choose_notA1A9[compiler] + choose_notA1A9[programming_language] <= 1
Bounds
Binaries
 choose_notA1A9[compiler] choose_notA1A9[programming_language]
End
