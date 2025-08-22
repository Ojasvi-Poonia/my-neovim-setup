return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "rebelot/kanagawa.nvim" -- Ensure kanagawa is loaded first
    },
    config = function()
        -- Get Kanagawa colors
        local kanagawa_colors = require("kanagawa.colors").setup()
        local palette = kanagawa_colors.palette
        local theme = kanagawa_colors.theme
        
        require("bufferline").setup({
            options = {
                mode = "tabs", -- Changed from "tabs" for better workflow
                style_preset = require("bufferline").style_preset.no_italic,
                themeable = true,
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                
                -- Enhanced diagnostics display
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                show_duplicate_prefix = false,
                
                -- Improved offsets for file explorer
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "󰙅 Explorer",
                        text_align = "left",
                        separator = true,
                    },
                    {
                        filetype = "neo-tree",
                        text = "󰙅 Explorer", 
                        text_align = "left",
                        separator = true,
                    }
                },
                
                -- Custom sorting for better organization
                sort_by = "insert_after_current",
                
                -- Better tab display
                max_name_length = 25,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 21,
            },
            
            -- Custom highlights that work with Kanagawa
            highlights = {
                fill = {
                    bg = theme.ui.bg_dim,
                },
                background = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_dim,
                },
                buffer_selected = {
                    fg = theme.ui.fg,
                    bg = theme.ui.bg,
                    bold = true,
                    italic = false,
                },
                buffer_visible = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_p1,
                },
                close_button = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_dim,
                },
                close_button_visible = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_p1,
                },
                close_button_selected = {
                    fg = palette.samuraiRed,
                    bg = theme.ui.bg,
                },
                tab_selected = {
                    fg = theme.ui.fg,
                    bg = theme.ui.bg,
                },
                tab = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_dim,
                },
                tab_close = {
                    fg = theme.ui.fg_dim,
                    bg = theme.ui.bg_dim,
                },
                duplicate_selected = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg,
                    italic = false,
                },
                duplicate_visible = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg_p1,
                    italic = false,
                },
                duplicate = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg_dim,
                    italic = false,
                },
                separator = {
                    fg = theme.ui.bg_dim,
                    bg = theme.ui.bg_dim,
                },
                separator_selected = {
                    fg = theme.ui.bg,
                    bg = theme.ui.bg,
                },
                separator_visible = {
                    fg = theme.ui.bg_p1,
                    bg = theme.ui.bg_p1,
                },
                indicator_selected = {
                    fg = palette.crystalBlue,
                    bg = theme.ui.bg,
                },
                modified = {
                    fg = palette.autumnYellow,
                    bg = theme.ui.bg_dim,
                },
                modified_selected = {
                    fg = palette.autumnYellow,
                    bg = theme.ui.bg,
                },
                modified_visible = {
                    fg = palette.autumnYellow,
                    bg = theme.ui.bg_p1,
                },
                -- Error diagnostics
                error = {
                    fg = palette.samuraiRed,
                    bg = theme.ui.bg_dim,
                },
                error_selected = {
                    fg = palette.samuraiRed,
                    bg = theme.ui.bg,
                },
                error_diagnostic = {
                    fg = palette.samuraiRed,
                    bg = theme.ui.bg_dim,
                },
                error_diagnostic_selected = {
                    fg = palette.samuraiRed,
                    bg = theme.ui.bg,
                },
                -- Warning diagnostics  
                warning = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg_dim,
                },
                warning_selected = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg,
                },
                warning_diagnostic = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg_dim,
                },
                warning_diagnostic_selected = {
                    fg = palette.roninYellow,
                    bg = theme.ui.bg,
                },
            },
        })
    end,
}

