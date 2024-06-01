return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim',  },
		config = function()
			local telescope = require("telescope")
			local keymap = vim.keymap

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc="Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc="Fuzzy find files in cwd" })
		end
	},
}
