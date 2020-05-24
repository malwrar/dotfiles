" if version > 580
"     hi clear
"     if exists("syntax_on")
"         syntax reset
"     endif
" endif

let g:colors_name = "malwrar"
set background=dark

" source: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" Primitive colors
let s:black      = { "gui": "{{ colors.black.rgb }}",      "cterm": "{{ colors.black.num }}" }
let s:dark_grey  = { "gui": "{{ colors.dark_grey.rgb }}",  "cterm": "{{ colors.dark_grey.num }}" }
let s:light_grey = { "gui": "{{ colors.light_grey.rgb }}", "cterm": "{{ colors.light_grey.num }}" }
let s:white      = { "gui": "{{ colors.white.rgb }}",      "cterm": "{{ colors.white.num }}" }

" General settings
let s:normal               = { }
let s:current_row          = { "bg": s:black }
let s:current_column       = { "bg": s:black }
let s:line_number          = { "fg": s:black }
let s:line_number_current  = { "fg": s:black }
let s:selected             = { "bg": s:black }
let s:comment              = { "fg": s:dark_grey }
let s:keywords             = { "fg": s:white }
let s:numbers              = { "fg": s:white }
let s:strings              = { "fg": s:white }
let s:comments             = { "fg": s:white }
" 
" " Default Colors
call s:h("Normal",                         s:normal)
call s:h("NonText",                        s:normal)
call s:h("Cursor",                         s:normal)
call s:h("lCursor",                        s:normal)
call s:h("CursorLine",                     s:current_row)
call s:h("CursorColumn",                   s:normal)
call s:h("ColorColumn",                    s:normal)

call s:h("Visual",                         s:selected)
call s:h("MatchParen",                     s:normal)
call s:h("Folded",                         s:normal)

" Search
call s:h("Search",                         s:normal)
call s:h("IncSearch",                      s:normal)

" Window Elements
call s:h("LineNr",                         s:line_number)
call s:h("StatusLine",                     s:normal)
call s:h("StatusLineNC",                   s:normal)
call s:h("VertSplit",                      s:normal)

" Preproc
call s:h("PreProc",                        s:normal)
hi! link Include                           PreProc
hi! link Define                            PreProc
hi! link Macro                             PreProc
hi! link PreCondit                         PreProc

" Keyword
call s:h("Statement",                      s:normal) " if for while
hi! link Conditonal                        Statement
hi! link Repeat                            Statement
call s:h("Label",                          s:normal)
hi! link Operator                          Statement " {, (, + - *...
hi! link Keyword                           Statement
hi! link Exception                         Statement

" Types
call s:h("Type",                           s:normal) " void bool char int
hi! link Typedef                           Type
call s:h("Structure",                      s:normal) " class struct
hi! link StorageClass                      Type
hi! link Identifier                        Type
hi! link Function                          Type

" Primitives
call s:h("Constant",                       s:normal)
call s:h("Boolean",                        s:normal)
call s:h("Number",                         s:normal)
call s:h("Float",                          s:normal)
call s:h("String",                         s:normal)

" Specials
call s:h("Special",                        s:normal) " ({})
hi! link SpecialChar                       Special
hi! link Tag                               Special
hi! link Delimiter                         Special

call s:h("Debug",                          s:normal)
call s:h("Error",                          s:normal)

call s:h("WildMenu",                       s:normal)
call s:h("ModeMsg",                        s:normal) " CMake commands options
call s:h("MoreMsg",                        s:normal)
call s:h("WarningMsg",                     s:normal) " CMake generator expression
call s:h("ErrorMsg",                       s:normal)

" Code comment
call s:h("Todo",                           s:normal)
call s:h("Comment",                        s:normal)
call s:h("SpecialComment",                 s:normal)

" Doxygen colors
hi! def link doxygenBrief                  Comment
hi! def link doxygenComment                Comment
hi! def link doxygenBrief                  Comment
hi! def link doxygenComment                Comment " //! /*! *
hi! def link doxygenSpecialOneLineDesc     Comment
hi! def link doxygenSpecialTypeOneLineDesc Comment
hi! def link doxygenSpecial                SpecialComment " @
hi! def link doxygenParam                  SpecialComment " brief param return
hi! def link doxygenBOther                 SpecialComment " file
hi! def link doxygenParamName              SpecialComment

" Spell
call s:h("SpellBad",                       s:normal)
call s:h("SpellCap",                       s:normal)
call s:h("SpellRare",                      s:normal)
call s:h("SpellLocal",                     s:normal)

" Diff
call s:h("DiffChange",                     s:normal)
call s:h("DiffText",                       s:normal)
call s:h("DiffAdd",                        s:normal)
call s:h("DiffDelete",                     s:normal)

" Signify, git-gutter
hi link SignifySignAdd                     DiffAdd
hi link SignifySignDelete                  DiffDelete
hi link SignifySignChange                  DiffChange
hi link GitGutterAdd                       DiffAdd
hi link GitGutterDelete                    DiffDelete
hi link GitGutterChange                    DiffChange
hi link GitGutterChangeDelete              DiffChange

" Completion Menu
call s:h("Pmenu",                          s:normal)
call s:h("PmenuSel",                       s:normal)
call s:h("PmenuThumb",                     s:normal)
call s:h("PmenuSbar",                      s:normal)

" HTML syntax
hi! link htmlTag                           Special
hi! link htmlEndTag                        htmlTag
hi! link htmlTagName                       Type
hi! link htmlTagN                          Type " html5 tags show up as htmlTagN

" XML syntax
hi! link xmlTag                            htmlTag
hi! link xmlEndTag                         xmlTag
hi! link xmlTagName                        htmlTagName

" HTML content
call s:h("htmlH1",                         s:normal)
call s:h("htmlH2",                         s:normal)
call s:h("htmlH3",                         s:normal)
call s:h("htmlH4",                         s:normal)
call s:h("htmlH5",                         s:normal)
call s:h("htmlH6",                         s:normal)
call s:h("htmlLink",                       s:normal)
call s:h("htmlItalic",                     s:normal)
call s:h("htmlBold",                       s:normal)
call s:h("htmlBoldItalic",                 s:normal)
call s:h("htmlString",                     s:normal)

" Markdown content
hi! link markdownH1                        htmlH1
hi! link markdownH2                        htmlH2
hi! link markdownH3                        htmlH3
hi! link markdownH4                        htmlH4
hi! link markdownH5                        htmlH5
hi! link markdownH6                        htmlH6
hi! link markdownUrl                       htmlLink
call s:h("markdownBlockquote",             s:normal)
call s:h("markdownBold",                   s:normal)
call s:h("markdownItalic",                 s:normal)
call s:h("markdownBoldItalic",             s:normal)
call s:h("markdownEscape",                 s:normal)
call s:h("markdownHeadingDelimiter",       s:normal)
call s:h("markdownHeadingRule",            s:normal)
call s:h("markdownId",                     s:normal)
call s:h("markdownIdDeclaration",          s:normal)
call s:h("markdownLinkDelimiter",          s:normal)
call s:h("markdownLinkText",               s:normal)
call s:h("markdownLinkTextDelimiter",      s:normal)
call s:h("markdownListMarker",             s:normal)
call s:h("markdownOrderedListMarker",      s:normal)
call s:h("markdownRule",                   s:normal)
call s:h("markdownUrlDelimiter",           s:normal)
call s:h("markdownUrlTitle",               s:normal)
call s:h("markdownUrlTitleDelimiter",      s:normal)
call s:h("markdownCode",                   s:normal)
call s:h("markdownCodeDelimiter",          s:normal)

"""    " Settings dependent on g:nyx_blackout
"""    call <SID>X("Normal", s:foreground, s:chosen_background, "")
"""    call <SID>X("LineNr", s:comment, s:chosen_background, "")
"""    if version >= 700
"""        call <SID>X("SignColumn", "", s:chosen_background, "none")
"""    end
"""    call <SID>X("Todo", s:red, s:chosen_background, "bold")
"""
"""    " Option g:nyx_italic_comments
"""    if exists( "g:nyx_italic_comments") && g:nyx_italic_comments
"""        call <SID>X("Comment", s:comment, "", "italic")
"""    else
"""        " make the global variable available to command mode
"""        let g:nyx_italic_comments = 0
"""        call <SID>X("Comment", s:comment, "", "")
"""    endif
"""
"""    " Vim Highlighting
"""    call <SID>X("Normal", s:selection, "", "")
"""    call <SID>X("LineNr", s:selection, "", "")
"""    call <SID>X("NonText", s:selection, "", "")
"""    call <SID>X("SpecialKey", s:selection, "", "")
"""    call <SID>X("Search", s:background, s:yellow, "")
"""    call <SID>X("TabLine", s:window, s:foreground, "reverse")
"""    call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
"""    call <SID>X("StatusLine", s:window, s:yellow, "reverse")
"""    call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
"""    call <SID>X("VertSplit", s:window, s:window, "none")
"""    call <SID>X("Visual", "", s:selection, "")
"""    call <SID>X("Directory", s:blue, "", "")
"""    call <SID>X("ModeMsg", s:green, "", "")
"""    call <SID>X("MoreMsg", s:green, "", "")
"""    call <SID>X("Question", s:green, "", "")
"""    call <SID>X("WarningMsg", s:orange, "", "bold")
"""    call <SID>X("MatchParen", "", s:selection, "")
"""    call <SID>X("Folded", s:comment, s:background, "")
"""    call <SID>X("FoldColumn", "", s:background, "")
"""    call <SID>X("CursorLine", "", s:line, "none")
"""    call <SID>X("CursorLineNR", s:orange, "", "none")
"""    call <SID>X("CursorColumn", "", s:line, "none")
"""    call <SID>X("Pmenu", s:foreground, s:menu_background, "none")
"""    call <SID>X("PmenuSel", s:foreground, s:menu_background, "reverse")
"""
"""    " Standard Highlighting
"""    call <SID>X("Title", s:comment, "", "bold")
"""    call <SID>X("Identifier", s:orange, "", "")
"""    call <SID>X("Statement", s:wine, "", "")
"""    call <SID>X("Conditional", s:wine, "", "")
"""    call <SID>X("Repeat", s:wine, "", "")
"""    call <SID>X("Structure", s:wine, "", "")
"""    call <SID>X("Function", s:orange, "", "")
"""    call <SID>X("Constant", s:purple, "", "")
"""    call <SID>X("Keyword", s:orange, "", "")
"""    call <SID>X("String", s:yellow, "", "")
"""    call <SID>X("Special", s:blue, "", "")
"""    call <SID>X("PreProc", s:green, "", "")
"""    call <SID>X("Operator", s:purple, "", "")
"""    call <SID>X("Type", s:blue, "", "")
"""    call <SID>X("Define", s:wine, "", "")
"""    call <SID>X("Include", s:wine, "", "")
"""    call <SID>X("Tag", s:orange, "", "bold")
"""    call <SID>X("Underlined", s:orange, "", "underline")
"""
"""    syntax match commonOperator "\(+\|=\|-\|*\|\^\|\/\||\)"
"""    hi! link commonOperator Operator
"""
"""    " Vim Highlighting
"""    call <SID>X("vimCommand", s:wine, "", "none")
"""
"""    " C Highlighting
"""    call <SID>X("cType", s:wine, "", "")
"""    call <SID>X("cStorageClass", s:orange, "", "")
"""    call <SID>X("cConditional", s:wine, "", "")
"""    call <SID>X("cRepeat", s:wine, "", "")
"""
"""    " PHP Highlighting
"""    call <SID>X("phpVarSelector", s:wine, "", "")
"""    call <SID>X("phpKeyword", s:wine, "", "")
"""    call <SID>X("phpRepeat", s:wine, "", "")
"""    call <SID>X("phpConditional", s:wine, "", "")
"""    call <SID>X("phpStatement", s:wine, "", "")
"""    call <SID>X("phpMemberSelector", s:foreground, "", "")
"""
"""    " Ruby Highlighting
"""    call <SID>X("rubySymbol", s:blue, "", "")
"""    call <SID>X("rubyConstant", s:green, "", "")
"""    call <SID>X("rubyAccess", s:yellow, "", "")
"""    call <SID>X("rubyAttribute", s:blue, "", "")
"""    call <SID>X("rubyInclude", s:blue, "", "")
"""    call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
"""    call <SID>X("rubyCurlyBlock", s:orange, "", "")
"""    call <SID>X("rubyStringDelimiter", s:yellow, "", "")
"""    call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
"""    call <SID>X("rubyConditional", s:wine, "", "")
"""    call <SID>X("rubyRepeat", s:wine, "", "")
"""    call <SID>X("rubyControl", s:wine, "", "")
"""    call <SID>X("rubyException", s:wine, "", "")
"""
"""    " Crystal Highlighting
"""    call <SID>X("crystalSymbol", s:green, "", "")
"""    call <SID>X("crystalConstant", s:yellow, "", "")
"""    call <SID>X("crystalAccess", s:yellow, "", "")
"""    call <SID>X("crystalAttribute", s:blue, "", "")
"""    call <SID>X("crystalInclude", s:blue, "", "")
"""    call <SID>X("crystalLocalVariableOrMethod", s:orange, "", "")
"""    call <SID>X("crystalCurlyBlock", s:orange, "", "")
"""    call <SID>X("crystalStringDelimiter", s:green, "", "")
"""    call <SID>X("crystalInterpolationDelimiter", s:orange, "", "")
"""    call <SID>X("crystalConditional", s:wine, "", "")
"""    call <SID>X("crystalRepeat", s:wine, "", "")
"""    call <SID>X("crystalControl", s:wine, "", "")
"""    call <SID>X("crystalException", s:wine, "", "")
"""
"""    " Python Highlighting
"""    call <SID>X("pythonInclude", s:green, "", "italic")
"""    call <SID>X("pythonStatement", s:blue, "", "")
"""    call <SID>X("pythonConditional", s:wine, "", "")
"""    call <SID>X("pythonRepeat", s:wine, "", "")
"""    call <SID>X("pythonException", s:orange, "", "")
"""    call <SID>X("pythonFunction", s:green, "", "italic")
"""    call <SID>X("pythonPreCondit", s:wine, "", "")
"""    call <SID>X("pythonExClass", s:orange, "", "")
"""    call <SID>X("pythonBuiltin", s:blue, "", "")
"""    call <SID>X("pythonOperator", s:wine, "", "")
"""    call <SID>X("pythonNumber", s:purple, "", "")
"""    call <SID>X("pythonString", s:yellow, "", "")
"""    call <SID>X("pythonRawString", s:yellow, "", "")
"""    call <SID>X("pythonDecorator", s:wine, "", "")
"""    call <SID>X("pythonDoctest", s:yellow, "", "")
"""    call <SID>X("pythonImportFunction", s:orange, "", "")
"""    call <SID>X("pythonImportModule", s:orange, "", "")
"""    call <SID>X("pythonImportObject", s:orange, "", "")
"""    call <SID>X("pythonImportedClassDef", s:orange, "", "")
"""    call <SID>X("pythonImportedFuncDef", s:orange, "", "")
"""    call <SID>X("pythonImportedModule", s:orange, "", "")
"""    call <SID>X("pythonImportedObject", s:orange, "", "")
"""
"""    " JavaScript Highlighting
"""    call <SID>X("javaScriptEndColons", s:foreground, "", "")
"""    call <SID>X("javaScriptOpSymbols", s:foreground, "", "")
"""    call <SID>X("javaScriptLogicSymbols", s:foreground, "", "")
"""    call <SID>X("javaScriptBraces", s:foreground, "", "")
"""    call <SID>X("javaScriptParens", s:foreground, "", "")
"""    call <SID>X("javaScriptFunction", s:green, "", "")
"""    call <SID>X("javaScriptComment", s:comment, "", "")
"""    call <SID>X("javaScriptLineComment", s:comment, "", "")
"""    call <SID>X("javaScriptDocComment", s:comment, "", "")
"""    call <SID>X("javaScriptCommentTodo", s:red, "", "")
"""    call <SID>X("javaScriptString", s:yellow, "", "")
"""    call <SID>X("javaScriptRegexpString", s:yellow, "", "")
"""    call <SID>X("javaScriptTemplateString", s:yellow, "", "")
"""    call <SID>X("javaScriptNumber", s:purple, "", "")
"""    call <SID>X("javaScriptFloat", s:purple, "", "")
"""    call <SID>X("javaScriptGlobal", s:purple, "", "")
"""    call <SID>X("javaScriptCharacter", s:blue, "", "")
"""    call <SID>X("javaScriptPrototype", s:blue, "", "")
"""    call <SID>X("javaScriptConditional", s:blue, "", "")
"""    call <SID>X("javaScriptBranch", s:blue, "", "")
"""    call <SID>X("javaScriptIdentifier", s:orange, "", "")
"""    call <SID>X("javaScriptRepeat", s:blue, "", "")
"""    call <SID>X("javaScriptStatement", s:blue, "", "")
"""    call <SID>X("javaScriptMessage", s:blue, "", "")
"""    call <SID>X("javaScriptReserved", s:blue, "", "")
"""    call <SID>X("javaScriptOperator", s:blue, "", "")
"""    call <SID>X("javaScriptNull", s:purple, "", "")
"""    call <SID>X("javaScriptBoolean", s:purple, "", "")
"""    call <SID>X("javaScriptLabel", s:blue, "", "")
"""    call <SID>X("javaScriptSpecial", s:blue, "", "")
"""    call <SID>X("javaScriptExceptions", s:red, "", "")
"""    call <SID>X("javaScriptDeprecated", s:red, "", "")
"""    call <SID>X("javaScriptError", s:red, "", "")
"""
"""    " LaTeX
"""    call <SID>X("texStatement",s:blue, "", "")
"""    call <SID>X("texMath", s:wine, "", "none")
"""    call <SID>X("texMathMacher", s:yellow, "", "none")
"""    call <SID>X("texRefLabel", s:wine, "", "none")
"""    call <SID>X("texRefZone", s:blue, "", "none")
"""    call <SID>X("texComment", s:comment, "", "none")
"""    call <SID>X("texDelimiter", s:purple, "", "none")
"""    call <SID>X("texMathZoneX", s:purple, "", "none")
"""
"""    " CoffeeScript Highlighting
"""    call <SID>X("coffeeRepeat", s:wine, "", "")
"""    call <SID>X("coffeeConditional", s:wine, "", "")
"""    call <SID>X("coffeeKeyword", s:wine, "", "")
"""    call <SID>X("coffeeObject", s:yellow, "", "")
"""
"""    " HTML Highlighting
"""    call <SID>X("htmlTag", s:blue, "", "")
"""    call <SID>X("htmlEndTag", s:blue, "", "")
"""    call <SID>X("htmlTagName", s:wine, "", "bold")
"""    call <SID>X("htmlArg", s:green, "", "italic")
"""    call <SID>X("htmlScriptTag", s:wine, "", "")
"""
"""    " Diff Highlighting
"""    call <SID>X("diffAdd", "", "4c4e39", "")
"""    call <SID>X("diffDelete", s:background, s:red, "")
"""    call <SID>X("diffChange", "", "2B5B77", "")
"""    call <SID>X("diffText", s:line, s:blue, "")
"""
"""    " ShowMarks Highlighting
"""    call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
"""    call <SID>X("ShowMarksHLo", s:wine, s:background, "none")
"""    call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
"""    call <SID>X("ShowMarksHLm", s:wine, s:background, "none")
"""
"""    " Lua Highlighting
"""    call <SID>X("luaStatement", s:wine, "", "")
"""    call <SID>X("luaRepeat", s:wine, "", "")
"""    call <SID>X("luaCondStart", s:wine, "", "")
"""    call <SID>X("luaCondElseif", s:wine, "", "")
"""    call <SID>X("luaCond", s:wine, "", "")
"""    call <SID>X("luaCondEnd", s:wine, "", "")
"""
"""    " Cucumber Highlighting
"""    call <SID>X("cucumberGiven", s:blue, "", "")
"""    call <SID>X("cucumberGivenAnd", s:blue, "", "")
"""
"""    " Go Highlighting
"""    call <SID>X("goDirective", s:wine, "", "")
"""    call <SID>X("goDeclaration", s:wine, "", "")
"""    call <SID>X("goStatement", s:wine, "", "")
"""    call <SID>X("goConditional", s:wine, "", "")
"""    call <SID>X("goConstants", s:orange, "", "")
"""    call <SID>X("goTodo", s:red, "", "")
"""    call <SID>X("goDeclType", s:blue, "", "")
"""    call <SID>X("goBuiltins", s:wine, "", "")
"""    call <SID>X("goRepeat", s:wine, "", "")
"""    call <SID>X("goLabel", s:wine, "", "")
"""
"""    " Clojure Highlighting
"""    call <SID>X("clojureConstant", s:orange, "", "")
"""    call <SID>X("clojureBoolean", s:orange, "", "")
"""    call <SID>X("clojureCharacter", s:orange, "", "")
"""    call <SID>X("clojureKeyword", s:green, "", "")
"""    call <SID>X("clojureNumber", s:orange, "", "")
"""    call <SID>X("clojureString", s:green, "", "")
"""    call <SID>X("clojureRegexp", s:green, "", "")
"""    call <SID>X("clojureParen", s:wine, "", "")
"""    call <SID>X("clojureVariable", s:yellow, "", "")
"""    call <SID>X("clojureCond", s:blue, "", "")
"""    call <SID>X("clojureDefine", s:wine, "", "")
"""    call <SID>X("clojureException", s:red, "", "")
"""    call <SID>X("clojureFunc", s:blue, "", "")
"""    call <SID>X("clojureMacro", s:blue, "", "")
"""    call <SID>X("clojureRepeat", s:blue, "", "")
"""    call <SID>X("clojureSpecial", s:wine, "", "")
"""    call <SID>X("clojureQuote", s:blue, "", "")
"""    call <SID>X("clojureUnquote", s:blue, "", "")
"""    call <SID>X("clojureMeta", s:blue, "", "")
"""    call <SID>X("clojureDeref", s:blue, "", "")
"""    call <SID>X("clojureAnonArg", s:blue, "", "")
"""    call <SID>X("clojureRepeat", s:blue, "", "")
"""    call <SID>X("clojureDispatch", s:blue, "", "")
"""
"""    " Scala Highlighting
"""    call <SID>X("scalaKeyword", s:wine, "", "")
"""    call <SID>X("scalaKeywordModifier", s:wine, "", "")
"""    call <SID>X("scalaOperator", s:blue, "", "")
"""    call <SID>X("scalaPackage", s:wine, "", "")
"""    call <SID>X("scalaFqn", s:foreground, "", "")
"""    call <SID>X("scalaFqnSet", s:foreground, "", "")
"""    call <SID>X("scalaImport", s:wine, "", "")
"""    call <SID>X("scalaBoolean", s:orange, "", "")
"""    call <SID>X("scalaDef", s:wine, "", "")
"""    call <SID>X("scalaVal", s:wine, "", "")
"""    call <SID>X("scalaVar", s:wine, "", "")
"""    call <SID>X("scalaClass", s:wine, "", "")
"""    call <SID>X("scalaObject", s:wine, "", "")
"""    call <SID>X("scalaTrait", s:wine, "", "")
"""    call <SID>X("scalaDefName", s:blue, "", "")
"""    call <SID>X("scalaValName", s:foreground, "", "")
"""    call <SID>X("scalaVarName", s:foreground, "", "")
"""    call <SID>X("scalaClassName", s:foreground, "", "")
"""    call <SID>X("scalaType", s:yellow, "", "")
"""    call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
"""    call <SID>X("scalaAnnotation", s:orange, "", "")
"""    call <SID>X("scalaNumber", s:orange, "", "")
"""    call <SID>X("scalaDefSpecializer", s:yellow, "", "")
"""    call <SID>X("scalaClassSpecializer", s:yellow, "", "")
"""    call <SID>X("scalaBackTick", s:green, "", "")
"""    call <SID>X("scalaRoot", s:foreground, "", "")
"""    call <SID>X("scalaMethodCall", s:blue, "", "")
"""    call <SID>X("scalaCaseType", s:yellow, "", "")
"""    call <SID>X("scalaLineComment", s:comment, "", "")
"""    call <SID>X("scalaComment", s:comment, "", "")
"""    call <SID>X("scalaDocComment", s:comment, "", "")
"""    call <SID>X("scalaDocTags", s:comment, "", "")
"""    call <SID>X("scalaEmptyString", s:green, "", "")
"""    call <SID>X("scalaMultiLineString", s:green, "", "")
"""    call <SID>X("scalaUnicode", s:orange, "", "")
"""    call <SID>X("scalaString", s:green, "", "")
"""    call <SID>X("scalaStringEscape", s:green, "", "")
"""    call <SID>X("scalaSymbol", s:orange, "", "")
"""    call <SID>X("scalaChar", s:orange, "", "")
"""    call <SID>X("scalaXml", s:green, "", "")
"""    call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
"""    call <SID>X("scalaBackTick", s:blue, "", "")
"""
"""    " Git
"""    call <SID>X("diffAdded", s:green, "", "")
"""    call <SID>X("diffRemoved", s:red, "", "")
"""    call <SID>X("diffLine", s:blue, "", "italic")
"""    call <SID>X("diffSubname", s:foreground, "", "")
"""    call <SID>X("gitFile", s:orange, "", "")
"""    call <SID>X("gitcommitSummary", "", "", "bold")
"""
"""    " coc.nvim
"""    hi! link CocErrorSign WarningMsg
"""    hi! link CocWarningSign Number
"""    hi! link CocInfoSign Type
"""
"""    " Delete Functions
"""    delf <SID>h
