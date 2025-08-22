-- lua/ojas/plugins/lsp/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		------------------------------------------------------------------
		-- Imports
		------------------------------------------------------------------
		local lspconfig = require("lspconfig")
		local mason_lsp = require("mason-lspconfig")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()
		local keymap = vim.keymap

		------------------------------------------------------------------
		-- Key-maps (run once per attached buffer)
		------------------------------------------------------------------
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		------------------------------------------------------------------
		-- Diagnostic symbols in the sign column
		------------------------------------------------------------------
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type, numhl = "" })
		end

		------------------------------------------------------------------
		-- Mason-lspconfig (v2) – install & configure servers
		------------------------------------------------------------------
		mason_lsp.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
			},

			handlers = {
				----------------------------------------------------------------
				-- Default handler for every server you don't override below
				----------------------------------------------------------------
				function(server)
					lspconfig[server].setup({ capabilities = capabilities })
				end,

				----------------------------------------------------------------
				-- Svelte: notify server when JS/TS files change
				----------------------------------------------------------------
				svelte = function()
					lspconfig.svelte.setup({
						capabilities = capabilities,
						on_attach = function(client, _)
							vim.api.nvim_create_autocmd("BufWritePost", {
								pattern = { "*.js", "*.ts" },
								callback = function(ctx)
									client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end,
							})
						end,
					})
				end,

				----------------------------------------------------------------
				-- GraphQL: extend filetypes
				----------------------------------------------------------------
				graphql = function()
					lspconfig.graphql.setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,

				----------------------------------------------------------------
				-- Emmet
				----------------------------------------------------------------
				emmet_ls = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				----------------------------------------------------------------
				-- Lua LS – recognise `vim` global and tweak snippets
				----------------------------------------------------------------
				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
			},
		})
	end,
}
