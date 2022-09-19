if exists('b:current_syntax')
    finish
endif

syntax sync clear
syntax sync fromstart

syntax case match

syntax keyword fishKeyword begin function end
syntax keyword fishConditional if else switch
syntax keyword fishRepeat while for in
syntax keyword fishLabel case
syntax keyword fishUnix
                \ admin alias ar asa at awk basename batch bc bg break c99 cal cat cd cflow chgrp chmod chown cksum
                \ cmpcolon comm command compress continue cp crontab csplit ctags curl cut cxref date dd delta df
                \ diff dirname dot du echo ed egrep env eval ex exec exit expand export expr false fc fg fgrep file
                \ find fold fort77 fuser gencat get getconf getopts grep hash head iconv id ipcrm ipcs jobs join kill
                \ lex link ln locale localedef logger logname lp ls m4 mailx make man mesg mkdir mkfifo more mv
                \ newgrp nice nl nm nohup od paste patch pathchk pax pr printf prs ps pwd qalter qdel qhold qmove
                \ qmsg qrerun qrls qselect qsig qstat qsub read readonly renice return rm rmdel rmdir sact sccs sed
                \ set sh shift sleep sort split strings strip stty tabs tail talk tee test time times touch tput tr
                \ trap true tsort tty type ulimit umask unalias uname uncompress unexpand unget uniq unlink unset
                \ uucp uudecode uuencode uustat uux val vi wait wc wget what who write xargs yacc zcat zegrep
                \ zfgrep zgrep

syntax match fishTests /\v<%(contains|test|count|not)>/ nextgroup=fishStatement,fishSpecial skipwhite

syntax match fishComment /#.*/
syntax match fishSpecial /\\$/
syntax match fishOption	"\s\zs[-+][-_a-zA-Z#@]\+"
syntax match fishOption	"\s\zs--[^ \t$`'"|);]\+"
syntax match fishIdentifier /\$[[:alnum:]_]\+/
syntax region fishString start=/'/ skip=/\\'/ end=/'/
syntax region fishString start=/"/ skip=/\\"/ end=/"/ contains=fishIdentifier
syntax match fishCharacter /\v\\[abefnrtv *?~%#(){}\[\]<>&;"']|\\[xX][0-9a-f]{1,2}|\\o[0-7]{1,2}|\\u[0-9a-f]{1,4}|\\U[0-9a-f]{1,8}|\\c[a-z]/
syntax match fishStatement /\v;\s*\zs\k+>/
syntax match fishCommandSub /\v\(\s*\zs\k+>/

syntax region fishLineContinuation matchgroup=fishStatement
            \ start='\v^\s*\zs\k+>' skip='\\$' end='$'
            \ contains=fishSpecial,fishOption,fishIdentifier,fishString,fishCharacter,fishStatement,fishCommandSub,fishComment

highlight default link fishKeyword Keyword
highlight default link fishConditional Conditional
highlight default link fishRepeat Repeat
highlight default link fishLabel Label
highlight default link fishUnix Statement
highlight default link fishComment Comment
highlight default link fishSpecial Special
highlight default link fishOption PreCondit
highlight default link fishIdentifier Identifier
highlight default link fishTests Identifier
highlight default link fishString String
highlight default link fishCharacter Character
highlight default link fishStatement Statement
highlight default link fishCommandSub fishStatement

let b:current_syntax = 'fish'

