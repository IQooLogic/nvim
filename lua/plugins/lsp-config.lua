return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					-- "github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = { "lua_ls", "gopls", "jdtls", "rust_analyzer" },
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},
	-- archived
	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	config = function()
	-- 		local rt = require("rust-tools")
	-- 		rt.setup({
	-- 			tools = {
	-- 				runnables = {
	-- 					use_telescope = true,
	-- 				},
	-- 				inlay_hints = {
	-- 					auto = true,
	-- 					show_parameter_hints = true,
	-- 					parameter_hints_prefix = "",
	-- 					other_hints_prefix = "",
	-- 				},
	-- 			},
	--
	-- 			-- all the opts to send to nvim-lspconfig
	-- 			-- these override the defaults set by rust-tools.nvim
	-- 			-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	-- 			server = {
	-- 				-- on_attach is a callback called when the language server attachs to the buffer
	-- 				on_attach = function(_, bufnr)
	-- 					-- Hover actions
	-- 					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
	-- 					-- Code action groups
	-- 					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
	-- 				end,
	-- 				settings = {
	-- 					-- to enable rust-analyzer settings visit:
	-- 					-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
	-- 					["rust-analyzer"] = {
	-- 						-- enable clippy on save
	-- 						checkOnSave = {
	-- 							command = "clippy",
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			opts = {},
		},
		event = { "BufReadPost" },
		config = function()
			require("neodev").setup({})

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
			lspconfig.gopls.setup({ capabilities = capabilities,
                root_dir = function ()
                    return vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
                end
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			local opts = {}
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
			vim.keymap.set("n", "<leader>e", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts) -- show linter errors in floating panel
			vim.keymap.set("n", "<C-f>", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
		end,
	},
}
