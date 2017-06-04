syn match cppNamespace    "\w\+\s*::"me=e-2
syn match cppNamespaceStd "std\s*::"me=e-2
syn match cppColonColon   "::"

hi def link cppNamespace  myUnimportant
hi def link cppColonColon myUnimportant
