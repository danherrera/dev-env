return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"lua_ls",
					"kotlin_language_server",
					"gopls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("eslint", {})
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {},
				},
			})
			vim.lsp.config("emmet_ls", {})

			vim.lsp.enable({ "eslint", "lua_ls", "rust_analyzer", "emmet_ls" })

			-- Navigation
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})

			-- Diagnostics
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, {})
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

			-- Actions
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, {})

			-- Info
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {})

			-- Workspace
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})

			-- Inlay hints toggle
			vim.keymap.set("n", "<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, {})
		end,
	},
}
