let g:vsnip_snippet_dir="~/.config/nvim/vim-vsnip"

imap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-l>'
smap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-l>'
imap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.html = ['html']
let g:vsnip_filetypes.typescriptreact = ['html']
let g:vsnip_filetypes.javascriptreact = ['html']
