" Plugins {{{1
call plug#begin()
" LSP client configs.
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" LSP client UI.
Plug 'tami5/lspsaga.nvim'

" Treesitter configurations and abstraction layer for Neovim.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate', 'commit': '1ed2a3c' }

" Completion engine.
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp', { 'commit': 'affe808a' }
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

" Insert or delete brackets, parens, quotes in pair.
Plug 'windwp/nvim-autopairs'

" Comment stuff out.
Plug 'tpope/vim-commentary'

" NerdTree
Plug 'preservim/nerdtree'

call plug#end()

" General {{{1
set number
set relativenumber
set signcolumn=number
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

" HTML {{{1
autocmd FileType html call SetupHTML()
func SetupHTML()
	setlocal expandtab shiftwidth=4 tabstop=4
endfunc

" CSS {{{1
autocmd FileType css call SetupCSS()
func SetupCSS()
	setlocal expandtab shiftwidth=4 tabstop=4
endfunc

" JSON {{{1
autocmd FileType json call SetupJSON()
func SetupJSON()
	setlocal expandtab shiftwidth=2 tabstop=2
endfunc

" C/C++ {{{1
autocmd FileType c,cpp call SetupCCpp()
func SetupCCpp()
	setlocal expandtab shiftwidth=4 tabstop=4
	setlocal commentstring=//%s
endfunc

" ES6 {{{1
autocmd FileType javascript,typescript,javascriptreact,typescriptreact call SetupES6()
func SetupES6()
	setlocal expandtab smarttab shiftwidth=2 tabstop=2
	setlocal commentstring={/*\ %s\ */}
endfunc

" NERDTree {{{1
let NERDTreeShowHidden=1
nnoremap <c-f> :NERDTreeFocus<cr>
nnoremap F :NERDTreeFind<cr>

" Others {{{1
" Save buffer content.
nnoremap <leader>w :w<cr>

" Close window.
noremap <leader>q :q<cr>

" Close all windows.
nnoremap <leader>Q :qa<cr>

" Delete buffer.
nnoremap <leader>bd :bd<cr>
