
set verbose=0   " increment to aid in debugging

" execute pathogen#infect()
filetype plugin indent on     " plugins are enabled
filetype plugin on            " plugins are enabled

" Recognize *.cljx files as Clojure source. Can place in ~/.vimrc or ~/.vim/ftdetect/cljx.vim
" autocmd BufWinEnter,BufNewFile,BufRead *.cljx set filetype=clojure

" Remove the period `.`, hyphen, `-`, and slash `/` as keyword chars so "word" movement will stop 
" on these chars (i.e. in a namespace like `proj.some.long.ns.name` or a symbol like `my-clojure-sym`)
" Must do one at a time for 'string lists'
autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=.
autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=-
autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=/

" Vim Fireplace shortcuts
nnoremap  <C-e>     :%Eval<CR>
nnoremap  <C-e>     :Eval<CR>
:command! EE        %Eval

let g:clojure_align_multiline_strings = 1

let groovy_allow_cpp_keywords = 1  " #awt todo:  fix this at vim.org (groovy.vim)

" Turn on source code syntax coloring
syntax enable

colorscheme desert
" colorscheme slate
" colorscheme default

" The minimal shell /bin/ash is faster than /bin/bash or /bin/tcsh on startup
set shell=/bin/zsh

" Basic settings
set visualbell
set noerrorbells
set diffopt=filler,iwhite
set shiftwidth=2
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set ignorecase
set smartcase
set hlsearch
set nobackup
set nowrap
set equalalways
set selectmode="mouse,key,cmd"
set fileformat=unix
set fileformats=unix,dos
set ruler
set number
set nowrap
set equalalways
set selectmode="mouse,key,cmd"
set fileformat=unix
set fileformats=unix,dos
set ruler
set textwidth=100
set scrolloff=5
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,tags
set path=.
set path+=src/**
set path+=html/**
set path+=test/**
set path+=resources/**
set path+=source/**
set path+=source-test/**

" Fix the difficult-to-read default setting for search/replace text
" highlighting.  The bang (!) is required since we are overwriting the
" DiffText setting.  Use the ":highlight" command in vim to see
" alternate color choices if you don't like "Todo" or "StatusLine"
highlight! link   IncSearch  Todo           " Yellow 
highlight! link      Search  StatusLine     " Light tan 

" Fix the difficult-to-read default setting for diff text highlighting.
" The bang (!) is required since we are overwriting the DiffText
" setting. The highlighting for "Todo" also looks nice (yellow) if you
" don't like the "MatchParen" (Aqua) diff color.
highlight! link DiffText MatchParen     " Aqua 
"   highlight! link DiffText Todo       " Yellow 

" Note: User-defined commands must begin with a capital letter 
 
" Define an easy way to source files (Vertical bar '|' concats 2 commands on one line. It can also
" be done with a crtl-v/vrtl-j combination)
:command! SRC source ~/.vimrc  | source ~/.gvimrc

" Only works for X Windows diff on Cygwin (not Win GUI diff)
set diffexpr=MyDiff()
function! MyDiff()
  let l:opt = '-a --binary '
  if &diffopt =~ 'icase'  | let l:opt = l:opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let l:opt = l:opt . '-w ' | endif
  let arg1 = v:fname_in
  let arg2 = v:fname_new
  let arg3 = v:fname_out
  " let cmd = '/opt/freeware/bin/diff'
  " let cmd = 'diff'
  " silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  silent execute '!/usr/bin/diff ' . l:opt . arg1 . ' ' . arg2 . ' > ' . arg3
  " Can do 'silent execute' or just 'execute'
  " :new | redraw | echo "there is a new window"
  "
  " Needed?  can we delete these?
  " if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  " if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  " if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
endfunction

" Write a protected file using sudo
:command! W w !sudo tee % > /dev/null


" Rainbow Parentheses stuff
    " let g:rbpt_colorpairs = [
    "     \ ['brown',       'RoyalBlue3'],
    "     \ ['Darkblue',    'SeaGreen3'],
    "     \ ['darkgray',    'DarkOrchid3'],
    "     \ ['darkgreen',   'firebrick3'],
    "     \ ['darkcyan',    'RoyalBlue3'],
    "     \ ['darkred',     'SeaGreen3'],
    "     \ ['darkmagenta', 'DarkOrchid3'],
    "     \ ['brown',       'firebrick3'],
    "     \ ['gray',        'RoyalBlue3'],
    "     \ ['black',       'SeaGreen3'],
    "     \ ['darkmagenta', 'DarkOrchid3'],
    "     \ ['Darkblue',    'firebrick3'],
    "     \ ['darkgreen',   'RoyalBlue3'],
    "     \ ['darkcyan',    'SeaGreen3'],
    "     \ ['darkred',     'DarkOrchid3'],
    "     \ ['red',         'firebrick3'],
    "     \ ]
    " let g:rbpt_max = 16
    " let g:rbpt_loadcmd_toggle = 0
    " 
    " au VimEnter * RainbowParenthesesToggle
    " au Syntax   * RainbowParenthesesLoadRound
    " au Syntax   * RainbowParenthesesLoadSquare
    " au Syntax   * RainbowParenthesesLoadBraces

" Example of how to add other keywords for syntax highlighting
    " let s:clojure_syntax_keywords = {
    "     \   'clojureBoolean': ["false","true"]
    "     \ , 'clojureCond': ["case","clojure.core/case","clojure.core/cond","clojure.core/cond->","clojure.core/cond->>","clojure.core/condp","clojure.core/if-let","clojure.core/if-not","clojure.core/if-some","clojure.core/when","clojure.core/when-first","clojure.core/when-let","clojure.core/when-not","clojure.core/when-some","cond","cond->","cond->>","condp","if-let","if-not","if-some","when","when-first","when-let","when-not","when-some"]
    "     \ , 'clojureConstant': ["nil"]
    "     \ , 'clojureDefine': ["clojure.core/definline","clojure.core/definterface","clojure.core/defmacro","clojure.core/defmethod","clojure.core/defmulti","clojure.core/defn","clojure.core/defn-","clojure.core/defonce","clojure.core/defprotocol","clojure.core/defrecord","clojure.core/defstruct","clojure.core/deftype","definline","definterface","defmacro","defmethod","defmulti","defn","defn-","defonce","defprotocol","defrecord","defstruct","deftype"]
    "     \ , 'clojureException': ["catch","finally","throw","try"]
    "     \ , 'clojureFunc': ["*","*'","+","+'","-","-'","->ArrayChunk","->Vec","->VecNode","->VecSeq","-cache-protocol-fn","-reset-methods","/","<","<=","=","==",">",">=","accessor","aclone","add-classpath","add-watch","agent","agent-error","agent-errors","aget","alength","alias","all-ns","alter","alter-meta!","alter-var-root","ancestors","apply","array-map","aset","aset-boolean","aset-byte","aset-char","aset-double","aset-float","aset-int","aset-long","aset-short","assoc","assoc!","assoc-in","associative?","atom","await","await-for","await1","bases","bean","bigdec","bigint","biginteger","bit-and","bit-and-not","bit-clear","bit-flip","bit-not","bit-or","bit-set","bit-shift-left","bit-shift-right","bit-test","bit-xor","boolean","boolean-array","booleans","bound-fn*","bound?","butlast","byte","byte-array","bytes","cast","char","char-array","char?","chars","chunk","chunk-append","chunk-buffer","chunk-cons","chunk-first","chunk-next","chunk-rest","chunked-seq?","class","class?","clear-agent-errors","clojure-version","clojure.core/*","clojure.core/*'","clojure.core/+","clojure.core/+'","clojure.core/-","clojure.core/-'","clojure.core/->ArrayChunk","clojure.core/->Vec","clojure.core/->VecNode","clojure.core/->VecSeq","clojure.core/-cache-protocol-fn","clojure.core/-reset-methods","clojure.core//","clojure.core/<","clojure.core/<=","clojure.core/=","clojure.core/==","clojure.core/>","clojure.core/>=","clojure.core/accessor","clojure.core/aclone","clojure.core/add-classpath","clojure.core/add-watch","clojure.core/agent","clojure.core/agent-error","clojure.core/agent-errors","clojure.core/aget","clojure.core/alength","clojure.core/alias","clojure.core/all-ns","clojure.core/alter","clojure.core/alter-meta!","clojure.core/alter-var-root","clojure.core/ancestors","clojure.core/apply","clojure.core/array-map","clojure.core/aset","clojure.core/aset-boolean","clojure.core/aset-byte","clojure.core/aset-char","clojure.core/aset-double","clojure.core/aset-float","clojure.core/aset-int","clojure.core/aset-long","clojure.core/aset-short","clojure.core/assoc","clojure.core/assoc!","clojure.core/assoc-in","clojure.core/associative?","clojure.core/atom","clojure.core/await","clojure.core/await-for","clojure.core/await1","clojure.core/bases","clojure.core/bean","clojure.core/bigdec","clojure.core/bigint","clojure.core/biginteger","clojure.core/bit-and","clojure.core/bit-and-not","clojure.core/bit-clear","clojure.core/bit-flip","clojure.core/bit-not","clojure.core/bit-or","clojure.core/bit-set","clojure.core/bit-shift-left","clojure.core/bit-shift-right","clojure.core/bit-test","clojure.core/bit-xor","clojure.core/boolean","clojure.core/boolean-array","clojure.core/booleans","clojure.core/bound-fn*","clojure.core/bound?","clojure.core/butlast","clojure.core/byte","clojure.core/byte-array","clojure.core/bytes","clojure.core/cast","clojure.core/char","clojure.core/char-array","clojure.core/char?","clojure.core/chars","clojure.core/chunk","clojure.core/chunk-append","clojure.core/chunk-buffer","clojure.core/chunk-cons","clojure.core/chunk-first","clojure.core/chunk-next","clojure.core/chunk-rest","clojure.core/chunked-seq?","clojure.core/class","clojure.core/class?","clojure.core/clear-agent-errors","clojure.core/clojure-version","clojure.core/coll?","clojure.core/commute","clojure.core/comp","clojure.core/comparator","clojure.core/compare","clojure.core/compare-and-set!","clojure.core/compile","clojure.core/complement","clojure.core/concat","clojure.core/conj","clojure.core/conj!","clojure.core/cons","clojure.core/constantly","clojure.core/construct-proxy","clojure.core/contains?","clojure.core/count","clojure.core/counted?","clojure.core/create-ns","clojure.core/create-struct","clojure.core/cycle","clojure.core/dec","clojure.core/dec'","clojure.core/decimal?","clojure.core/delay?","clojure.core/deliver","clojure.core/denominator","clojure.core/deref","clojure.core/derive","clojure.core/descendants","clojure.core/destructure","clojure.core/disj","clojure.core/disj!","clojure.core/dissoc","clojure.core/dissoc!","clojure.core/distinct","clojure.core/distinct?","clojure.core/doall","clojure.core/dorun","clojure.core/double","clojure.core/double-array","clojure.core/doubles","clojure.core/drop","clojure.core/drop-last","clojure.core/drop-while","clojure.core/empty","clojure.core/empty?","clojure.core/ensure","clojure.core/enumeration-seq","clojure.core/error-handler","clojure.core/error-mode","clojure.core/eval","clojure.core/even?","clojure.core/every-pred","clojure.core/every?","clojure.core/ex-data","clojure.core/ex-info","clojure.core/extend","clojure.core/extenders","clojure.core/extends?","clojure.core/false?","clojure.core/ffirst","clojure.core/file-seq","clojure.core/filter","clojure.core/filterv","clojure.core/find","clojure.core/find-keyword","clojure.core/find-ns","clojure.core/find-protocol-impl","clojure.core/find-protocol-method","clojure.core/find-var","clojure.core/first","clojure.core/flatten","clojure.core/float","clojure.core/float-array","clojure.core/float?","clojure.core/floats","clojure.core/flush","clojure.core/fn?","clojure.core/fnext","clojure.core/fnil","clojure.core/force","clojure.core/format","clojure.core/frequencies","clojure.core/future-call","clojure.core/future-cancel","clojure.core/future-cancelled?","clojure.core/future-done?","clojure.core/future?","clojure.core/gensym","clojure.core/get","clojure.core/get-in","clojure.core/get-method","clojure.core/get-proxy-class","clojure.core/get-thread-bindings","clojure.core/get-validator","clojure.core/group-by","clojure.core/hash","clojure.core/hash-combine","clojure.core/hash-map","clojure.core/hash-ordered-coll","clojure.core/hash-set","clojure.core/hash-unordered-coll","clojure.core/identical?","clojure.core/identity","clojure.core/ifn?","clojure.core/in-ns","clojure.core/inc","clojure.core/inc'","clojure.core/init-proxy","clojure.core/instance?","clojure.core/int","clojure.core/int-array","clojure.core/integer?","clojure.core/interleave","clojure.core/intern","clojure.core/interpose","clojure.core/into","clojure.core/into-array","clojure.core/ints","clojure.core/isa?","clojure.core/iterate","clojure.core/iterator-seq","clojure.core/juxt","clojure.core/keep","clojure.core/keep-indexed","clojure.core/key","clojure.core/keys","clojure.core/keyword","clojure.core/keyword?","clojure.core/last","clojure.core/line-seq","clojure.core/list","clojure.core/list*","clojure.core/list?","clojure.core/load","clojure.core/load-file","clojure.core/load-reader","clojure.core/load-string","clojure.core/loaded-libs","clojure.core/long","clojure.core/long-array","clojure.core/longs","clojure.core/macroexpand","clojure.core/macroexpand-1","clojure.core/make-array","clojure.core/make-hierarchy","clojure.core/map","clojure.core/map-indexed","clojure.core/map?","clojure.core/mapcat","clojure.core/mapv","clojure.core/max","clojure.core/max-key","clojure.core/memoize","clojure.core/merge","clojure.core/merge-with","clojure.core/meta","clojure.core/method-sig","clojure.core/methods","clojure.core/min","clojure.core/min-key","clojure.core/mix-collection-hash","clojure.core/mod","clojure.core/munge","clojure.core/name","clojure.core/namespace","clojure.core/namespace-munge","clojure.core/neg?","clojure.core/newline","clojure.core/next","clojure.core/nfirst","clojure.core/nil?","clojure.core/nnext","clojure.core/not","clojure.core/not-any?","clojure.core/not-empty","clojure.core/not-every?","clojure.core/not=","clojure.core/ns-aliases","clojure.core/ns-imports","clojure.core/ns-interns","clojure.core/ns-map","clojure.core/ns-name","clojure.core/ns-publics","clojure.core/ns-refers","clojure.core/ns-resolve","clojure.core/ns-unalias","clojure.core/ns-unmap","clojure.core/nth","clojure.core/nthnext","clojure.core/nthrest","clojure.core/num","clojure.core/number?","clojure.core/numerator","clojure.core/object-array","clojure.core/odd?","clojure.core/parents","clojure.core/partial","clojure.core/partition","clojure.core/partition-all","clojure.core/partition-by","clojure.core/pcalls","clojure.core/peek","clojure.core/persistent!","clojure.core/pmap","clojure.core/pop","clojure.core/pop!","clojure.core/pop-thread-bindings","clojure.core/pos?","clojure.core/pr","clojure.core/pr-str","clojure.core/prefer-method","clojure.core/prefers","clojure.core/print","clojure.core/print-ctor","clojure.core/print-dup","clojure.core/print-method","clojure.core/print-simple","clojure.core/print-str","clojure.core/printf","clojure.core/println","clojure.core/println-str","clojure.core/prn","clojure.core/prn-str","clojure.core/promise","clojure.core/proxy-call-with-super","clojure.core/proxy-mappings","clojure.core/proxy-name","clojure.core/push-thread-bindings","clojure.core/quot","clojure.core/rand","clojure.core/rand-int","clojure.core/rand-nth","clojure.core/range","clojure.core/ratio?","clojure.core/rational?","clojure.core/rationalize","clojure.core/re-find","clojure.core/re-groups","clojure.core/re-matcher","clojure.core/re-matches","clojure.core/re-pattern","clojure.core/re-seq","clojure.core/read","clojure.core/read-line","clojure.core/read-string","clojure.core/realized?","clojure.core/record?","clojure.core/reduce","clojure.core/reduce-kv","clojure.core/reduced","clojure.core/reduced?","clojure.core/reductions","clojure.core/ref","clojure.core/ref-history-count","clojure.core/ref-max-history","clojure.core/ref-min-history","clojure.core/ref-set","clojure.core/refer","clojure.core/release-pending-sends","clojure.core/rem","clojure.core/remove","clojure.core/remove-all-methods","clojure.core/remove-method","clojure.core/remove-ns","clojure.core/remove-watch","clojure.core/repeat","clojure.core/repeatedly","clojure.core/replace","clojure.core/replicate","clojure.core/require","clojure.core/reset!","clojure.core/reset-meta!","clojure.core/resolve","clojure.core/rest","clojure.core/restart-agent","clojure.core/resultset-seq","clojure.core/reverse","clojure.core/reversible?","clojure.core/rseq","clojure.core/rsubseq","clojure.core/satisfies?","clojure.core/second","clojure.core/select-keys","clojure.core/send","clojure.core/send-off","clojure.core/send-via","clojure.core/seq","clojure.core/seq?","clojure.core/seque","clojure.core/sequence","clojure.core/sequential?","clojure.core/set","clojure.core/set-agent-send-executor!","clojure.core/set-agent-send-off-executor!","clojure.core/set-error-handler!","clojure.core/set-error-mode!","clojure.core/set-validator!","clojure.core/set?","clojure.core/short","clojure.core/short-array","clojure.core/shorts","clojure.core/shuffle","clojure.core/shutdown-agents","clojure.core/slurp","clojure.core/some","clojure.core/some-fn","clojure.core/some?","clojure.core/sort","clojure.core/sort-by","clojure.core/sorted-map","clojure.core/sorted-map-by","clojure.core/sorted-set","clojure.core/sorted-set-by","clojure.core/sorted?","clojure.core/special-symbol?","clojure.core/spit","clojure.core/split-at","clojure.core/split-with","clojure.core/str","clojure.core/string?","clojure.core/struct","clojure.core/struct-map","clojure.core/subs","clojure.core/subseq","clojure.core/subvec","clojure.core/supers","clojure.core/swap!","clojure.core/symbol","clojure.core/symbol?","clojure.core/take","clojure.core/take-last","clojure.core/take-nth","clojure.core/take-while","clojure.core/test","clojure.core/the-ns","clojure.core/thread-bound?","clojure.core/to-array","clojure.core/to-array-2d","clojure.core/trampoline","clojure.core/transient","clojure.core/tree-seq","clojure.core/true?","clojure.core/type","clojure.core/unchecked-add","clojure.core/unchecked-add-int","clojure.core/unchecked-byte","clojure.core/unchecked-char","clojure.core/unchecked-dec","clojure.core/unchecked-dec-int","clojure.core/unchecked-divide-int","clojure.core/unchecked-double","clojure.core/unchecked-float","clojure.core/unchecked-inc","clojure.core/unchecked-inc-int","clojure.core/unchecked-int","clojure.core/unchecked-long","clojure.core/unchecked-multiply","clojure.core/unchecked-multiply-int","clojure.core/unchecked-negate","clojure.core/unchecked-negate-int","clojure.core/unchecked-remainder-int","clojure.core/unchecked-short","clojure.core/unchecked-subtract","clojure.core/unchecked-subtract-int","clojure.core/underive","clojure.core/unsigned-bit-shift-right","clojure.core/update-in","clojure.core/update-proxy","clojure.core/use","clojure.core/val","clojure.core/vals","clojure.core/var-get","clojure.core/var-set","clojure.core/var?","clojure.core/vary-meta","clojure.core/vec","clojure.core/vector","clojure.core/vector-of","clojure.core/vector?","clojure.core/with-bindings*","clojure.core/with-meta","clojure.core/with-redefs-fn","clojure.core/xml-seq","clojure.core/zero?","clojure.core/zipmap","coll?","commute","comp","comparator","compare","compare-and-set!","compile","complement","concat","conj","conj!","cons","constantly","construct-proxy","contains?","count","counted?","create-ns","create-struct","cycle","dec","dec'","decimal?","delay?","deliver","denominator","deref","derive","descendants","destructure","disj","disj!","dissoc","dissoc!","distinct","distinct?","doall","dorun","double","double-array","doubles","drop","drop-last","drop-while","empty","empty?","ensure","enumeration-seq","error-handler","error-mode","eval","even?","every-pred","every?","ex-data","ex-info","extend","extenders","extends?","false?","ffirst","file-seq","filter","filterv","find","find-keyword","find-ns","find-protocol-impl","find-protocol-method","find-var","first","flatten","float","float-array","float?","floats","flush","fn?","fnext","fnil","force","format","frequencies","future-call","future-cancel","future-cancelled?","future-done?","future?","gensym","get","get-in","get-method","get-proxy-class","get-thread-bindings","get-validator","group-by","hash","hash-combine","hash-map","hash-ordered-coll","hash-set","hash-unordered-coll","identical?","identity","ifn?","in-ns","inc","inc'","init-proxy","instance?","int","int-array","integer?","interleave","intern","interpose","into","into-array","ints","isa?","iterate","iterator-seq","juxt","keep","keep-indexed","key","keys","keyword","keyword?","last","line-seq","list","list*","list?","load","load-file","load-reader","load-string","loaded-libs","long","long-array","longs","macroexpand","macroexpand-1","make-array","make-hierarchy","map","map-indexed","map?","mapcat","mapv","max","max-key","memoize","merge","merge-with","meta","method-sig","methods","min","min-key","mix-collection-hash","mod","munge","name","namespace","namespace-munge","neg?","newline","next","nfirst","nil?","nnext","not","not-any?","not-empty","not-every?","not=","ns-aliases","ns-imports","ns-interns","ns-map","ns-name","ns-publics","ns-refers","ns-resolve","ns-unalias","ns-unmap","nth","nthnext","nthrest","num","number?","numerator","object-array","odd?","parents","partial","partition","partition-all","partition-by","pcalls","peek","persistent!","pmap","pop","pop!","pop-thread-bindings","pos?","pr","pr-str","prefer-method","prefers","print","print-ctor","print-dup","print-method","print-simple","print-str","printf","println","println-str","prn","prn-str","promise","proxy-call-with-super","proxy-mappings","proxy-name","push-thread-bindings","quot","rand","rand-int","rand-nth","range","ratio?","rational?","rationalize","re-find","re-groups","re-matcher","re-matches","re-pattern","re-seq","read","read-line","read-string","realized?","record?","reduce","reduce-kv","reduced","reduced?","reductions","ref","ref-history-count","ref-max-history","ref-min-history","ref-set","refer","release-pending-sends","rem","remove","remove-all-methods","remove-method","remove-ns","remove-watch","repeat","repeatedly","replace","replicate","require","reset!","reset-meta!","resolve","rest","restart-agent","resultset-seq","reverse","reversible?","rseq","rsubseq","satisfies?","second","select-keys","send","send-off","send-via","seq","seq?","seque","sequence","sequential?","set","set-agent-send-executor!","set-agent-send-off-executor!","set-error-handler!","set-error-mode!","set-validator!","set?","short","short-array","shorts","shuffle","shutdown-agents","slurp","some","some-fn","some?","sort","sort-by","sorted-map","sorted-map-by","sorted-set","sorted-set-by","sorted?","special-symbol?","spit","split-at","split-with","str","string?","struct","struct-map","subs","subseq","subvec","supers","swap!","symbol","symbol?","take","take-last","take-nth","take-while","test","the-ns","thread-bound?","to-array","to-array-2d","trampoline","transient","tree-seq","true?","type","unchecked-add","unchecked-add-int","unchecked-byte","unchecked-char","unchecked-dec","unchecked-dec-int","unchecked-divide-int","unchecked-double","unchecked-float","unchecked-inc","unchecked-inc-int","unchecked-int","unchecked-long","unchecked-multiply","unchecked-multiply-int","unchecked-negate","unchecked-negate-int","unchecked-remainder-int","unchecked-short","unchecked-subtract","unchecked-subtract-int","underive","unsigned-bit-shift-right","update-in","update-proxy","use","val","vals","var-get","var-set","var?","vary-meta","vec","vector","vector-of","vector?","with-bindings*","with-meta","with-redefs-fn","xml-seq","zero?","zipmap"]
    "     \ , 'clojureMacro': ["->","->>","..","amap","and","areduce","as->","assert","binding","bound-fn","clojure.core/->","clojure.core/->>","clojure.core/..","clojure.core/amap","clojure.core/and","clojure.core/areduce","clojure.core/as->","clojure.core/assert","clojure.core/binding","clojure.core/bound-fn","clojure.core/comment","clojure.core/declare","clojure.core/delay","clojure.core/dosync","clojure.core/doto","clojure.core/extend-protocol","clojure.core/extend-type","clojure.core/for","clojure.core/future","clojure.core/gen-class","clojure.core/gen-interface","clojure.core/import","clojure.core/io!","clojure.core/lazy-cat","clojure.core/lazy-seq","clojure.core/letfn","clojure.core/locking","clojure.core/memfn","clojure.core/ns","clojure.core/or","clojure.core/proxy","clojure.core/proxy-super","clojure.core/pvalues","clojure.core/refer-clojure","clojure.core/reify","clojure.core/some->","clojure.core/some->>","clojure.core/sync","clojure.core/time","clojure.core/with-bindings","clojure.core/with-in-str","clojure.core/with-loading-context","clojure.core/with-local-vars","clojure.core/with-open","clojure.core/with-out-str","clojure.core/with-precision","clojure.core/with-redefs","comment","declare","delay","dosync","doto","extend-protocol","extend-type","for","future","gen-class","gen-interface","import","io!","lazy-cat","lazy-seq","letfn","locking","memfn","ns","or","proxy","proxy-super","pvalues","refer-clojure","reify","some->","some->>","sync","time","with-bindings","with-in-str","with-loading-context","with-local-vars","with-open","with-out-str","with-precision","with-redefs"]
    "     \ , 'clojureRepeat': ["clojure.core/doseq","clojure.core/dotimes","clojure.core/while","doseq","dotimes","while"]
    "     \ , 'clojureSpecial': [".","clojure.core/fn","clojure.core/let","clojure.core/loop","def","do","fn","if","let","loop","monitor-enter","monitor-exit","new","quote","recur","set!","var"]
    "     \ , 'clojureVariable': ["*1","*2","*3","*agent*","*allow-unresolved-vars*","*assert*","*clojure-version*","*command-line-args*","*compile-files*","*compile-path*","*compiler-options*","*data-readers*","*default-data-reader-fn*","*e","*err*","*file*","*flush-on-newline*","*fn-loader*","*in*","*math-context*","*ns*","*out*","*print-dup*","*print-length*","*print-level*","*print-meta*","*print-readably*","*read-eval*","*source-path*","*unchecked-math*","*use-context-classloader*","*verbose-defrecords*","*warn-on-reflection*","EMPTY-NODE","char-escape-string","char-name-string","clojure.core/*1","clojure.core/*2","clojure.core/*3","clojure.core/*agent*","clojure.core/*allow-unresolved-vars*","clojure.core/*assert*","clojure.core/*clojure-version*","clojure.core/*command-line-args*","clojure.core/*compile-files*","clojure.core/*compile-path*","clojure.core/*compiler-options*","clojure.core/*data-readers*","clojure.core/*default-data-reader-fn*","clojure.core/*e","clojure.core/*err*","clojure.core/*file*","clojure.core/*flush-on-newline*","clojure.core/*fn-loader*","clojure.core/*in*","clojure.core/*math-context*","clojure.core/*ns*","clojure.core/*out*","clojure.core/*print-dup*","clojure.core/*print-length*","clojure.core/*print-level*","clojure.core/*print-meta*","clojure.core/*print-readably*","clojure.core/*read-eval*","clojure.core/*source-path*","clojure.core/*unchecked-math*","clojure.core/*use-context-classloader*","clojure.core/*verbose-defrecords*","clojure.core/*warn-on-reflection*","clojure.core/EMPTY-NODE","clojure.core/char-escape-string","clojure.core/char-name-string","clojure.core/default-data-readers","clojure.core/primitives-classnames","clojure.core/unquote","clojure.core/unquote-splicing","default-data-readers","primitives-classnames","unquote","unquote-splicing"]
    "     \ }

