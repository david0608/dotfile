" Plugins {{{1
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'vim-python/python-syntax'
call plug#end()

" General {{{1
set mouse=a
set foldmethod=marker
let mapleader="-"

" Color scheme {{{1
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" Airline {{{1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_gruvbox_dark_medium'
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.colnr=" "
let g:airline_symbols.linenr=" "
let g:airline_symbols.maxlinenr=""

" Window {{{1
nnoremap ss :split<return><c-w>w
nnoremap sv :vsplit<return><c-w>w

nnoremap <space> <c-w>w

nnoremap sh <c-w>h
nnoremap sj <c-w>j
nnoremap sk <c-w>k
nnoremap sl <c-w>l

nnoremap s<left> <c-w>h
nnoremap s<down> <c-w>j
nnoremap s<up> <c-w>k
nnoremap s<right> <c-w>l

" Tab {{{1
nnoremap t<return> :tabedit<return>
nnoremap <s-tab> :tabprev<return>
nnoremap <tab> :tabnext<return>

" Comment {{{1
nnoremap <silent> <leader>c :<c-u>call CommentInNormal()<CR>
nnoremap <silent> <leader>uc :<c-u>call UnCommentInNormal()<CR>
vnoremap <silent> <leader>c :<c-u>call CommentInVisual()<CR>
vnoremap <silent> <leader>uc :<c-u>call UnCommentInVisual()<CR>

func CommentInNormal()
	if exists("b:comment_leader")
		exec "s/^/" .b:comment_leader ."/"
		noh
	else
		echom "b:comment_leader not declared."
	endif
endfunc

func UnCommentInNormal()
	if exists("b:comment_leader")
		exec "s/^" .b:comment_leader ."//"
		noh
	else
		echom "b:comment_leader not declared."
	endif
endfunc

func CommentInVisual()
	if exists("b:comment_leader")
		exec "'<,'>s/^/" .b:comment_leader ."/"
		noh
	else
		echom "b:comment_leader not declared."
	endif
endfunc

func UnCommentInVisual()
	if exists("b:comment_leader")
		exec "'<,'>s/^" .b:comment_leader ."//"
		noh
	else
		echom "b:comment_leader not declared."
	endif
endfunc

" Vim {{{1
autocmd FileType vim call SetupVim()
func SetupVim()
	let b:comment_leader="\" "
endfunc

" Python {{{1
let g:python_highlight_all=1

autocmd FileType python call SetupPython()
func SetupPython()
	let b:comment_leader="# "
endfunc

" Others {{{1
" Show syntax information short cut.
nnoremap <f2> :call SyntaxAttr()<cr>
