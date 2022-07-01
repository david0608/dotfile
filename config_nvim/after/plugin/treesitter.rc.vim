lua << EOF
require'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"javascript",
		"tsx",
		"json",
		"python",
	},
	autotag = {
		enable = true,
	}
}
EOF
