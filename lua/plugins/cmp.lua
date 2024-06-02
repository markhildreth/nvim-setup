return {
	"hrsh7th/nvim-cmp",
	event = {"InsertEnter", "CmdlineEnter"},
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	config = function()
		local cmp = require("cmp")
		cmp.setup({
			completeopt = "menu,menuone,preview,noselect",
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end
}
