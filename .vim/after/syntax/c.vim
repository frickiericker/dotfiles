syn match cOpenParen "?=("         contains=cParen,cCppParen
syn match cFunc      "\w\+\s*(\@=" contains=cOpenParen
syn match cComma     ","

hi def link cFunc  Function
hi def link cComma myStandout
