return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local keymap = vim.keymap;

		keymap.set("n", "gd", function() vim.lsp.buf.declaration() end, { desc="Go to declaration" })
		keymap.set("n", "gr", function() vim.lsp.buf.references() end, { desc="Go to references" })
		keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, { desc="Open code actions" })

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim "},
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.tsserver.setup({})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
		})
	end
}

