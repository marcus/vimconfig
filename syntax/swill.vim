" Vim syntax file
" Language:     Swill Templates
" Maintainer:   Jay Freeman <saurik@saurik.com>
" Last Change:  2007 Oct 6

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn sync fromstart

if b:swill == "css"
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlCssCode
elseif b:swill == "html"
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlHtmlCode
elseif b:swill == "js"
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlJsCode
elseif b:swill == "py"
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlPythonCode
elseif b:swill == "sql"
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlSqlCode
else
    syn region swlAll
        \ start=+^+
        \ end=+$+
        \ contains=@swlCode
endif

" Numbers {{{
syn cluster swlNumber contains=swlDecNumber,swlHexNumber

syn match swlHexNumber contained +\<-\?0x[0-9a-fA-F]\+\>+

syn match swlDecNumber contained +\<-\?[0-9]\+\>+
syn match swlDecNumber contained +\<-\?[0-9]\+\.[0-9]*\>+
syn match swlDecNumber contained +\<-\?\.[0-9]\+\>+
" }}}

syn match swlOperator contained +\.+
syn match swlOperator contained +;+

syn keyword swlConstant contained true false null this

syn keyword swlJsType contained function typeof var Array Object
syn keyword swlJsStatement contained _assert break catch continue do else finally for if in new return throw try while with

syn keyword swlIdentifier contained _catch _do _else _false _finally _for _function _if _in _new _null _return _this _throw _true _try _typeof _var _while _with
syn keyword swlSpecial contained constructor Packages prototype undefined

syn match swlIdentifier contained +/\@<!\<[a-zA-Z][_a-zA-Z0-9]*\>+
syn match swlSpecial contained +_[_a-zA-Z0-9]*+

syn region swlInclude contained
    \ matchgroup=swlIncludeMarker
    \ start=+#<+
    \ end=+>+

syn cluster swlSuper contains=swlScript,swlExpression,swlInclude,swlHtmlPythonScript,swlHtmlPythonDirective
syn cluster swlSub contains=swlHtmlTemplate,swlExpression,swlInclude,swlSqlTemplate,swlJsTemplate,swlCssTemplate,swlRegExTemplate,swlHtmlPythonScript,swlHtmlPythonDirective

syn cluster swlCode contains=@swlSub,swlJsStatement,swlJsType,swlParenthetical,@swlNumber,swlString,swlOperator,swlSpecial,swlConstant,swlJsRegEx,swlShortComment,swlLongComment,swlIdentifier

syn match swlEscape contained +\\.+

syn region swlString contained
    \ start=+"+
    \ end=+"+
    \ contains=@swlSub,swlEscape

syn region swlString contained
    \ start=+'+
    \ end=+'+
    \ contains=@swlSub

syn region swlParenthetical contained
    \ matchgroup=swlOperator
    \ start=+{+
    \ end=+}+
    \ contains=@swlCode

syn region swlParenthetical contained
    \ matchgroup=swlOperator
    \ start=+(+
    \ end=+)+
    \ contains=@swlCode

syn keyword swlTagName contained a abbr address b blockquote body cite code dd div dl dt em fieldset font h1 h2 h3 h4 h5 h6 head html i iframe img input label legend li link ol p pre small span strike strong sub sup table tbody td textarea tfoot th thead title tr tt type ul

" Css Templates {{{
syn cluster swlCssCode contains=@swlSuper,swlCssBlock,swlCssClass,swlLongComment,swlTagName
syn cluster swlCssStyle contains=@swlSuper,swlCssProperty,swlCssColor,swlCssNumber,swlCssUrl,swlCssConstant,swlCssSpecial,swlString,swlLongComment

syn region swlCssUrl contained
    \ start=+url(+
    \ end=+)+

syn match swlCssColor contained +#\<[0-9a-fA-F]\{3}\>+
syn match swlCssColor contained +#\<[0-9a-fA-F]\{6}\>+
syn match swlCssColor contained +\<rgba([^)]*)+
syn match swlCssColor contained +transparent+
syn keyword swlCssColor contained black blue brown green gray orange purple red white yellow

syn match swlCssClass contained +\.\<[-_a-zA-Z]\+\>+

syn keyword swlCssConstant contained absolute armenian auto baseline block bold both center circle dashed decimal decimal-leading-zero disc dotted double georgian hidden inherit inside italic larger left lower-alpha lower-greek lower-latin lower-roman middle no-repeat none normal outside relative right upper-alpha upper-latin upper-roman smaller solid square top underline
syn match swlCssConstant contained +\<border-box\>+
syn match swlCssConstant contained +\<repeat\(-[xy]\)\?\>+
syn match swlCssConstant contained +\<\(sans\)\?-serif\>+

syn match swlCssNumber contained +\<-\?[0-9]\+\(\(em\|pt\|px\|s\)\>\|\>%\)\?+

syn match swlCssSpecial contained +\<-\(moz\|ms\|webkit\)-[-a-zA-Z0-9]*\>+
syn match swlCssSpecial contained +!\<important\>+

syn keyword swlCssProperty contained clear color content display ellipsis float left letter-spacing nowrap opacity outline overflow position top vertical-align visibility
syn match swlCssProperty contained "\<border\(-\(bottom\|left\|right\|top\)\)\?\(-\(color\|style\|width\)\)\?\>"
syn match swlCssProperty contained "\<\(box-sizing\|line-height\|white-space\)\>"
syn match swlCssProperty contained "\<list-style\(-\(image\|position\|type\)\)\?\>"
syn match swlCssProperty contained "\<background\(-\(color\|image\|attachment\|position\(-[xy]\)\?\|repeat\)\)\?\>"
syn match swlCssProperty contained "\<\(\(max\|min\)-\)\?\(height\|width\)\>"
syn match swlCssProperty contained "\<font\(-\(family\|style\|variant\|weight\|size\(-adjust\)\?\|stretch\)\)\?\>"
syn match swlCssProperty contained "\<text-\(align\|decoration\|indent\|shadow\|overflow\|underline-style\)\>"
syn match swlCssProperty contained "\<\(margin\|padding\|border\)\(-\(top\|right\|bottom\|left\)\)\?\>"

syn region swlCssBlock contained
    \ start=+{+
    \ end=+}+
    \ contains=@swlCssStyle
" }}}
" Html Templates {{{
syn cluster swlHtmlCode contains=@swlSuper,swlHtmlComment,swlHtmlDirective,swlHtmlScript,swlHtmlOpenTag,swlHtmlCloseTag,swlHtmlStyle,swlHtmlProcess,swlHtmlPythonScript,swlHtmlPythonDirective

syn region swlHtmlOpenTag contained
    \ matchgroup=swlHtmlMarker
    \ start=+<+
    \ end=+\(/ *\)\?>+
    \ contains=@swlTagCode

syn region swlHtmlCloseTag contained
    \ matchgroup=swlHtmlMarker
    \ start=+</+
    \ end=+>+
    \ contains=@swlTagCode

syn region swlHtmlPythonScript contained
    \ matchgroup=swlMarker
    \ start=+<%=\?+
    \ end=+%>+
    \ contains=@swlPythonCode

syn region swlHtmlStyle contained
    \ matchgroup=swlMarker
    \ start=+<style[^>]*>+
    \ end=+</style>+
    \ contains=@swlCssCode

syn region swlHtmlScript contained
    \ matchgroup=swlMarker
    \ start=+<script[^>]*>+
    \ end=+</script>+
    \ contains=@swlJsCode

syn region swlHtmlComment contained
    \ start=+<!--+
    \ end=+-->+

syn region swlHtmlDirective contained
    \ matchgroup=swlMarker
    \ start=+<!--#+
    \ end=+-->+
    \ contains=@swlShtmlCode

syn region swlHtmlPythonDirective contained
    \ matchgroup=swlMarker
    \ start=+<%@+
    \ end=+%>+
    \ contains=@swlPspCode

syn region swlHtmlProcess contained
    \ start=+<?+
    \ end=+?>+
" }}}
" Python Templates {{{
syn cluster swlPythonCode contains=@swlSuper,swlPythonStatement,swlPythonType,swlPythonParenthetical,@swlNumber,swlString,swlOperator,swlSpecial,swlPythonConstant,swlIdentifier,swlPythonShortComment,swlPythonOperator

syn keyword swlPythonConstant contained True False None self
syn keyword swlPythonType contained bool buffer complex dict file float int list long str tuple
syn keyword swlPythonStatement contained def elif else except finally for if import in pass return try while with
syn keyword swlPythonOperator contained and not or

syn region swlPythonShortComment contained
    \ start=+#+
    \ end=+\n+

syn match swlPythonStatement +#end+

syn region swlPythonParenthetical contained
    \ matchgroup=swlOperator
    \ start=+{+
    \ end=+}+
    \ contains=@swlPythonCode

syn region swlPythonParenthetical contained
    \ matchgroup=swlOperator
    \ start=+(+
    \ end=+)+
    \ contains=@swlPythonCode
" }}}
" Psp Templates {{{
syn cluster swlPspCode contains=@swlSuper,swlPspDirective,swlString

syn keyword swlPspDirective contained include file
" }}}
" Tag Templates {{{
syn cluster swlTagCode contains=@swlSuper,swlString,swlTagName,swlTagAttribute,swlTagOperator

syn keyword swlTagName a img
syn keyword swlTagAttribute class href rel src style
syn match swlTagOperator +=+
" }}}
" Shtml Templates {{{
syn cluster swlShtmlCode contains=@swlSuper,swlShtmlDirective,swlString

syn keyword swlShtmlDirective contained elif else endif expr if include set value var virtual
" }}}
" Js Templates {{{
syn cluster swlJsCode contains=@swlSuper,swlJsStatement,swlJsType,swlJsParenthetical,@swlNumber,swlString,swlOperator,swlSpecial,swlConstant,swlJsRegEx,swlShortComment,swlLongComment,swlIdentifier

" XXX: support options, like g
syn region swlJsRegEx contained
    \ matchgroup=swlMarker
    \ start=+/ \@!+
    \ end=+/+
    \ contains=@swlRegExCode

syn region swlJsParenthetical contained
    \ matchgroup=swlOperator
    \ start=+{+
    \ end=+}+
    \ contains=@swlJsCode

syn region swlJsParenthetical contained
    \ matchgroup=swlOperator
    \ start=+(+
    \ end=+)+
    \ contains=@swlJsCode
" }}}
" RegEx Templates {{{
syn cluster swlRegExCode contains=@swlSuper,swlEscape,swlRegExOp,swlRegExText

syn match swlRegExText contained +[^\\]+
syn match swlRegExOp contained +[][.()+?*^$]+
" }}}
" Sql Templates {{{
syn cluster swlSqlCode contains=@swlSuper,swlSqlStatement,swlSqlIdentifier,@swlNumber,swlSqlMarker,swlConstant,swlSqlType,swlSqlString,swlLongComment,swlSqlShortComment

syn match swlSqlEscape contained +''+

syn region swlSqlString contained
    \ matchgroup=swlSqlString
    \ start=+'+
    \ end=+'+
    \ contains=swlSqlEscape

syn match swlSqlType contained +time with\(out\)\? time zone+

syn keyword swlSqlType contained bigint bigserial boolean bytea date float inet integer interval money numeric oid real serial text time timestamp uuid

syn keyword swlSqlStatement contained add alter and as begin by cascade case column commit create delete default distinct drop else end enum from glob group having in index inherits inner insert intersect into join key left like limit not on offset or order outer primary references rename right rollback select sequence set table temporary then to type union unique update user values view when where

syn region swlSqlShortComment contained
    \ start=+--+
    \ end=+\n+

syn match swlSqlMarker contained +?+

syn match swlSqlIdentifier contained +[a-zA-Z0-9_]\++

syn region swlSqlIdentifier contained
    \ start=+"+
    \ end=+"+
" }}}

syn region swlShortComment contained
    \ start=+//+
    \ end=+\n+

syn region swlLongComment contained
    \ start=+/\*+
    \ end=+\*/+

" Template Markers {{{
syn region swlExpression contained
    \ matchgroup=swlMarker
    \ start=+#(+
    \ end=+)+
    \ contains=@swlCode

syn region swlScript contained
    \ matchgroup=swlMarker
    \ start=+#{+
    \ end=+}+
    \ contains=@swlCode

syn region swlCssTemplate contained
    \ matchgroup=swlMarker
    \ start=+#$css{+
    \ end=+}+
    \ contains=@swlCssCode

syn region swlJsTemplate contained
    \ matchgroup=swlMarker
    \ start=+#$js{+
    \ end=+}+
    \ contains=@swlJsCode

syn region swlRegExTemplate contained
    \ matchgroup=swlMarker
    \ start=+#$regex{+
    \ end=+}+
    \ contains=@swlRegExCode

syn region swlSqlTemplate contained
    \ matchgroup=swlMarker
    \ start=+#$sql{+
    \ end=+}+
    \ contains=@swlSqlCode

syn region swlHtmlTemplate contained
    \ matchgroup=swlMarker
    \ start=+#\($html\)\?{+
    \ end=+}+
    \ contains=@swlHtmlCode
" }}}

" Default highlighting
if version >= 508 || !exists("did_swill_syntax_inits")
  if version < 508
    let did_msp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink swlOperator Operator
  HiLink swlMarker Special
  HiLink swlSqlMarker Special
  HiLink swlPythonType Type
  HiLink swlJsType Type
  HiLink swlExpression Special
  HiLink swlSqlStatement Statement
  HiLink swlSqlIdentifier Identifier
  HiLink swlPythonOperator Operator
  HiLink swlPythonStatement Statement
  HiLink swlJsStatement Statement
  HiLink swlPythonShortComment Comment
  HiLink swlSqlShortComment Comment
  HiLink swlShortComment Comment
  HiLink swlLongComment Comment
  HiLink swlDecNumber Number
  HiLink swlHexNumber Number
  HiLink swlCssNumber Number
  HiLink swlString String
  HiLink swlSpecial Special
  HiLink swlHtmlMarker Comment
  HiLink swlHtmlComment Comment
  HiLink swlHtmlProcess Comment
  HiLink swlHtmlOpenTag Identifier
  HiLink swlHtmlCloseTag Identifier
  HiLink swlInclude Type
  HiLink swlIncludeMarker Statement
  HiLink swlPythonConstant Constant
  HiLink swlConstant Constant
  HiLink swlSqlType Type
  HiLink swlSqlString String
  HiLink swlSqlEscape Special
  HiLink swlEscape Special
  HiLink swlRegEx String
  HiLink swlRegExOp Statement
  HiLink swlPspDirective Type
  HiLink swlShtmlDirective Type
  HiLink swlCssClass Identifier
  HiLink swlCssProperty Type
  HiLink swlCssColor Constant
  HiLink swlCssUrl Constant
  HiLink swlCssConstant Constant
  HiLink swlCssSpecial Special
  HiLink swlRegExText String
  HiLink swlTagName Statement
  HiLink swlTagAttribute Type
  HiLink swlTagOperator Operator

  delcommand HiLink
endif

let b:current_syntax = "swill"

" vim: ts=8

