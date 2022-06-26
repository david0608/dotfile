if !exists('g:lspconfig') | finish | endif

lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function (client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local opts = { noremap = true, silent = true }

	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)

	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
	end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
	capabilities = capabilities
}

nvim_lsp.pyright.setup{}
EOF
