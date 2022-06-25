if ! exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require'lspsaga'

saga.init_lsp_saga {
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	border_style = "round",
}
EOF

nnoremap <silent> <c-j> <cmd>Lspsaga diagnostic_jump_next<cr>
nnoremap <silent> K <cmd>Lspsaga hover_doc<cr>
inoremap <silent> <c-k> <cmd>Lspsaga signature_help<cr>
nnoremap <silent> gh <cmd>Lspsaga lsp_finder<cr>
