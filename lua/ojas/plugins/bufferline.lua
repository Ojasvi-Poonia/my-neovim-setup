-- lua/plugins/bufferline.lua
return {
	"akinsho/bufferline.nvim",
	dependencies = { "rose-pine" }, -- be sure Rosé Pine is loaded first
	event = "VeryLazy", -- delay until UI is ready
	opts = function()
		-- pull Rosé Pine colours (main, moon or dawn – whichever is active)
		local p = require("rose-pine.palette")

		-- common helpers for repeated styles
		local function fg(col)
			return { fg = col }
		end
		local function bg(col)
			return { bg = col }
		end

		return {
			highlights = {
				-- the bar itself
				fill = bg(p.surface),
				background = { fg = p.subtle, bg = p.surface },

				-- current buffer
				buffer_selected = { fg = p.text, bg = p.base, bold = true },

				-- inactive buffers
				buffer_visible = fg(p.text),
				buffer = fg(p.subtle),

				-- separators
				separator = fg(p.surface),
				separator_visible = fg(p.surface),
				separator_selected = fg(p.surface),

				-- tabs (enable if you use `show_tab_indicators = true`)
				tab_selected = { fg = p.text, bg = p.overlay, bold = true },
				tab = bg(p.surface),

				-- diagnostics (if you enabled them)
				diagnostic = fg(p.rose),
				diagnostic_visible = fg(p.rose),
				diagnostic_selected = { fg = p.rose, bold = true },
			},

			options = {
				mode = "buffers",
				separator_style = "thin",
				always_show_bufferline = false,
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
				},
			},
		}
	end,
}
