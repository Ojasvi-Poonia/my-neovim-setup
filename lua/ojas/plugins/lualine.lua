return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- We are going to dynamically use the colors from the loaded Kanagawa theme.
    -- This table will be empty until the colorscheme is loaded.
    -- lualine is smart enough to wait for the theme to be set.
    local colors = require("kanagawa.colors").setup().palette

    local my_kanagawa_theme = {
      normal = {
        a = { fg = colors.sumiInk0, bg = colors.dragonBlue, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk3 },
        c = { fg = colors.oldWhite, bg = colors.sumiInk1 },
      },
      insert = {
        a = { fg = colors.sumiInk0, bg = colors.dragonGreen, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk3 },
      },
      visual = {
        a = { fg = colors.sumiInk0, bg = colors.dragonViolet, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk3 },
      },
      command = {
        a = { fg = colors.sumiInk0, bg = colors.dragonYellow, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk3 },
      },
      replace = {
        a = { fg = colors.sumiInk0, bg = colors.dragonRed, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk3 },
      },
      inactive = {
        a = { fg = colors.oldWhite, bg = colors.sumiInk1, gui = "bold" },
        b = { fg = colors.oldWhite, bg = colors.sumiInk1 },
        c = { fg = colors.oldWhite, bg = colors.sumiInk1 },
      },
    }

    lualine.setup({
      options = {
        -- Here we tell lualine to use our custom kanagawa theme
        theme = my_kanagawa_theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        icons_enabled = true,
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.carpYellow }, -- Use a color from the theme!
          },
          'encoding',
          'fileformat',
          'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end,
}
