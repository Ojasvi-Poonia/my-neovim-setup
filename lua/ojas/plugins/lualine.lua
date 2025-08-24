-- lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "rose-pine" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = { theme = "rose-pine" },
		})
	end,
}
