local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.tabstop= 2
vim.opt.expandtab = false

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/nvim-cmp",
		},

		config = function()
			local cmp = require("cmp")
			cmp.setup({
				completeopt = "menu,menuone,preview,noselect",
				sources = {
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end
	},
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver" },
})
require("lspconfig").lua_ls.setup({
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
	}
})
require("lspconfig").tsserver.setup({})
require("neodev").setup()

