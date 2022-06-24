call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'vim-python/python-syntax'
call plug#end()

let mapleader="-"

set mouse=a

" Config color scheme.
" syntax enable
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" Config airline.
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_gruvbox_dark_medium'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"

" Enable all python syntax highlight.
let g:python_highlight_all=1

" Horizontial split short cut.
nnoremap ss :split<return><c-w>w
" Vertical split short cut.
nnoremap sv :vsplit<return><c-w>w
" Switch pane short cuts.
nnoremap <space> <c-w>w
nnoremap sh <c-w>h
nnoremap s<left> <c-w>h
nnoremap sj <c-w>j
nnoremap s<down> <c-w>j
nnoremap sk <c-w>k
nnoremap s<up> <c-w>k
nnoremap sl <c-w>l
nnoremap s<right> <c-w>l

" Create new tab short cut.
nnoremap t<return> :tabedit<return>
" Switch tab short cut.
nnoremap <s-tab> :tabprev<return>
nnoremap <tab> :tabnext<return>

" Show syntax information short cut.
nnoremap <f2> :call SyntaxAttr()<cr>

" Comment short cuts.
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

autocmd FileType vim call SetupVim()
func SetupVim()
	let b:comment_leader="\" "
endfunc

autocmd FileType python call SetupPython()
func SetupPython()
	let b:comment_leader="# "
endfunc
