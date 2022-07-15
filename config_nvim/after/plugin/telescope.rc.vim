lua << EOF
require'telescope'.setup{
	defaults = {
		initial_mode = "normal"
	},
	pickers = {
		find_files = {
			hidden = true,
		}
	}
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
