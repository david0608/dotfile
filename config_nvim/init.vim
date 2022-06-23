call plug#begin()
Plug 'overcache/NeoSolarized'
call plug#end()

set mouse=a

syntax enable
set background=dark
set termguicolors
colorscheme NeoSolarized

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap ss :split<return><c-w>w
nnoremap sv :vsplit<return><c-w>w

nnoremap <space> <c-w>w
nnoremap sh <c-w>h
nnoremap s<left> <c-w>h
nnoremap sj <c-w>j
nnoremap s<down> <c-w>j
nnoremap sk <c-w>k
nnoremap s<up> <c-w>k
nnoremap sl <c-w>l
nnoremap s<right> <c-w>l

nnoremap t<return> :tabedit<return>
nnoremap <s-tab> :tabprev<return>
nnoremap <tab> :tabnext<return>
