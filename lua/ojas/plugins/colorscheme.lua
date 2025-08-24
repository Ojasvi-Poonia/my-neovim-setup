return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- Make sure it loads first
		config = function()
			-- Call the setup function with our configuration
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "moon", -- moon is the darkest variant, perfect for dark theme preference
				dim_inactive_windows = false, -- Do not dim inactive windows
				extend_background_behind_borders = true,

				enable = {
					terminal = true, -- Set terminal colors (make sure terminal supports this)
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = true, -- Enable this for a transparent background
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {},

				-- Custom highlights to match your original Kanagawa overrides
				highlight_groups = {
					-- Make the line you are on stand out a bit more
					CursorLine = { bg = "surface" },

					-- Make visual selections have a more distinct background
					Visual = { bg = "highlight_med", blend = 20, inherit = false },

					-- Softer color for line numbers
					LineNr = { fg = "muted" },

					-- Make comments italic (matching your original preference)
					Comment = { fg = "subtle", italic = true },

					-- Make keywords italic (matching your original preference)
					Keyword = { fg = "pine", italic = false },

					-- Make statements bold (matching your original preference)
					Statement = { fg = "pine", bold = true },

					-- Make floating windows slightly different
					NormalFloat = { bg = "surface", blend = 80 },
					FloatBorder = { fg = "muted", bg = "surface" },
				},

				before_highlight = function(group, highlight, palette)
					-- You can add any additional customizations here if needed
				end,
			})

			-- Finally, apply the colorscheme (moon variant for darkest theme)
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
}
