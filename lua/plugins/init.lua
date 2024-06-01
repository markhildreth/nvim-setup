return {
	{ "nvim-treesitter/nvim-treesitter" },
	{ "folke/neodev.nvim" },
	{ "nvimtools/none-ls.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end
	},
}
