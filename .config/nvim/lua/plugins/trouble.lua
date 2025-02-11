return {
	"folke/trouble.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup({
			auto_open = false,
			auto_close = true,
			auto_preview = false,
			auto_fold = false,
			signs = {
				error = "error",
				warning = "warning",
				hint = "hint",
				information = "info",
				other = "other",
			},
			use_diagnostic_signs = true,
		})

		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>xw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xd", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>xl", function()
			require("trouble").toggle("loclist")
		end)
	end,
}
