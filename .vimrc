" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))


" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mfumi/ref-dicts-en'
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'

syntax enable
set background=dark    "または light
"colorscheme solarized"

" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" Required:
set tabstop=3 "画面上でタブ文字が占める幅
set shiftwidth=3 "自動インデントでずれる幅
set softtabstop=3 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set laststatus=2 
set expandtab
set number
set backspace=indent,eol,start
noremap! ^H <BS>
noremap! ^D <DEL>

colorscheme jellybeans
if &term =~ "xterm-256color" || "screen-256color"
   set t_Co=256
   set t_Sf=[3%dm
   set t_Sb=[4%dm
elseif &term =~ "xterm-color"
   set t_Co=8
   set t_Sf=[3%dm
   set t_Sb=[4%dm
endif

"if !has('gui_running')
"  set t_Co=256
"endif

" neocomplete用設定
"let g:neocomplete#enable_at_startup = 0
"let g:neocomplete#enable_ignore_case = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 2
"if !exists('g:neocomplete#keyword_patterns')
"	let g:neocomplete#keyword_patterns = {}
"endif

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.

"NeoBundleLazy 'mattn/excitetranslate-vim', {
"         \ 'depends': 'mattn/webapi-vim',
"         \ 'autoload' : { 'commands': ['ExciteTranslate']}
"         \ }
"xnoremap E :ExciteTranslate<CR>}}

let g:lightline = {
         \ 'colorscheme': 'jellybeans',
         \ }


" vim-ref のバッファを q で閉じられるようにする
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" 辞書定義
let g:ref_source_webdict_sites = {
         \   'je': {
         \     'url': 'http://ejje.weblio.jp/content/%s',
         \   },
         \   'ej': {
         \     'url': 'http://ejje.weblio.jp/content/%s',
         \   },
         \ }

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

" 出力に対するフィルタ
" 最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
   return join(split(a:output, "\n")[15 :], "\n")
endfunction

function! g:ref_source_webdict_sites.ej.filter(output)
   return join(split(a:output, "\n")[15 :], "\n")
endfunction

" 開いたバッファを q で閉じれるようにする
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q:<C-u>close<CR>


nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

