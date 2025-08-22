return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Make sure it loads first
    config = function()
      -- Call the setup function with our configuration
      require("kanagawa").setup({
        compile = false, -- Recommended for faster startup
        undercurl = true, -- Enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- Enable this for a transparent background
        dimInactive = false, -- Do not dim inactive windows
        terminalColors = true, -- Set terminal colors (make sure terminal supports this)

        -- Here we can override the default colors of the theme
        colors = {
          palette = {}, -- We are not changing the core palette colors
          theme = {
            -- The 'dragon' theme is the dark one.
            -- You can also override colors for 'wave' (light) or 'all' themes.
            dragon = {
              ui = {
                -- Make the background of floating windows slightly different
                float = { bg = "#1F212E" },
              },
            },
          },
        },

        -- Here we can override specific syntax groups
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- Make the line you are on stand out a bit more
            CursorLine = { bg = theme.ui.bg_p1 },

            -- Make visual selections have a more distinct background
            Visual = { bg = theme.ui.bg_p2, bold = true },
            
            -- Softer color for line numbers
            LineNr = { fg = theme.ui.fg_dim },
          }
        end,
      })

      -- Finally, apply the colorscheme
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
