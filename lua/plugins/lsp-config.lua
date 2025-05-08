return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "gopls", "jdtls", "rust_analyzer", "zls", "elixirls" },
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			opts = {},
		},
		event = { "BufReadPost" },
		config = function()
			require("neodev").setup()

			local cap = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("cmp_nvim_lsp").default_capabilities(cap)

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnipet = "Replace",
						},
					},
				},
			})
			-- table.insert(capabilities, root_dir)
			lspconfig.gopls.setup({
				capabilities = capabilities,
				root_dir = function()
					-- return vim.fn.getcwd()
					return vim.fs.dirname(vim.fs.find({ ".git", "go.mod" }, { upward = true })[1])
				end,
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
				root_dir = function()
					-- return vim.fn.getcwd()
					return vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1])
				end,
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
				filetypes = { "zig", "zir" },
				root_dir = function()
					return vim.fs.dirname(vim.fs.find({ "zls.json", "build.zig", ".git" }, { upward = true })[1])
				end,
				single_file_support = true,
			})

			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
				filetypes = { "elixir", "eelixir", "heex", "surface" },
				capabilities = capabilities,
				root_dir = function(fname)
					-- return vim.fn.getcwd()
					local matches = vim.fs.find({ "mix.exs" }, { upward = true, limit = 2, path = fname })
					local child_or_root_path, maybe_umbrella_path = table.unpack(matches)
					local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

					return root_dir
				end,
			})

			lspconfig.gleam.setup({
				cmd = { "gleam", "lsp" },
				filetypes = { "gleam" },
				root_dir = lspconfig.util.root_pattern("gleam.toml", ".git"),
				capabilities = capabilities,
			})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "jump to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "jump to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "symbol info" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "show symbol implementations" })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "show symbol signature info" })
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "list workspace folders" })
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "jump to type definition" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "show symbol code actions" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "show symbol references/usages" })
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "format file" })
			vim.keymap.set(
				"n",
				"<leader>e",
				':lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
				{ desc = "show list of errors" }
			)
			vim.keymap.set("n", "<C-f>", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
			vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, { desc = "Go to next [D]iagnostic message" })
		end,
	},
}
