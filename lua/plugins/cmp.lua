return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	config = function()
		local cmp = require("cmp")
		cmp.setup({
			-- TODO: What's up here?
			completeopt = "menu,menuone,preview,noselect",
			sources = {
				{ name = "buffer" },
				{ name = "path" },
			},
		})
	end
}
