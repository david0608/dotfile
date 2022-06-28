lua << EOF
require'nvim-lsp-installer'.setup{
	automatic_installation = true
}

local on_attach = function (client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	buf_set_keymap('n', '<c-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
	buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
	buf_set_keymap('i', '<c-k>', '<cmd>Lspsaga signature_help<cr>', opts)
	buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', opts)

	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
	end
end

local capabilities = require'cmp_nvim_lsp'.update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

require'lspconfig'.tsserver.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				signs = false
			}
		)
	}
}

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				signs = false
			}
		)
	}
}

require'lspsaga'.init_lsp_saga{
	border_style = "round"
}
EOF
