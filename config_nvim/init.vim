" Plugins {{{1
call plug#begin()
" LSP server installer.
Plug 'williamboman/nvim-lsp-installer'

" LSP client configs.
Plug 'neovim/nvim-lspconfig'

" LSP client UI.
Plug 'tami5/lspsaga.nvim'

" Completion engine.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippet engine.
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'

" Snippets.
Plug 'rafamadriz/friendly-snippets'

" File browser.
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'

" Status line.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Color theme.
Plug 'morhetz/gruvbox'

" Display syntax highlight attributes util.
Plug 'vim-scripts/SyntaxAttr.vim'

" Python syntax highlight.
Plug 'vim-python/python-syntax'

" Insert or delete brackets, parens, quotes in pair.
Plug 'windwp/nvim-autopairs'

call plug#end()

" General {{{1
set mouse=a
set foldmethod=marker
let mapleader="-"

nnoremap <leader>n :noh<cr>

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

" Buffer {{{1
nnoremap <s-tab> :bp<cr>
nnoremap <tab> :bn<cr>

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

" JSON {{{1
autocmd FileType json call SetupJSON()
func SetupJSON()
	setlocal expandtab shiftwidth=2 tabstop=2
endfunc

" ES6 {{{1
autocmd FileType javascript,typescript,javascriptreact,typescriptreact call SetupES6()
func SetupES6()
	setlocal expandtab smarttab shiftwidth=4 tabstop=4
endfunc

" Others {{{1
" Show syntax information short cut.
nnoremap <f2> :call SyntaxAttr()<cr>

" Save buffer content.
nnoremap <leader>w :w<cr>

" Close window.
noremap <leader>q :q<cr>

" Close all windows.
nnoremap <leader>Q :qa<cr>

" Delete buffer.
nnoremap <leader>bd :bd<cr>
