return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"biome",
				"jsonls",
				"eslint",
				"lua_ls",
				"marksman",
				"prismals",
				"nil_ls",
				"tailwindcss",
				"tsserver",
				"yamlls",
				"rust_analyzer",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"biome",
				"jsonls",
				"eslint",
				"lua_ls",
				"marksman",
				"prismals",
				"nil_ls",
				"tailwindcss",
				"tsserver",
				"yamlls",
				"luacheck",
				"codespell",
				"stylua",
				"prettierd",
				"markdownlint",
				"yamllint",
				"rust_analyzer",
			},
		})
	end,
}
