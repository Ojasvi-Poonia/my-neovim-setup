# Neovim Beginner Setup

A clean, **beginner-friendly** Neovim configuration written in Lua.  
Plug-and-play: clone, open Neovim, and start coding.

---

## 📁 Directory Layout

```
init.lua
lua/
└─ ojas/
├─ core/ → editor options & keymaps
│ ├─ keymaps.lua
│ └─ options.lua
├─ lazy.lua → lazy.nvim boot-strapper
└─ plugins/ → one file per plugin
├─ alpha.lua
├─ auto-session.lua
├─ autopairs.lua
├─ bufferline.lua
├─ colorscheme.lua
├─ comment.lua
├─ dressing.lua
├─ flash.lua
├─ formatting.lua
├─ gitsigns.lua
├─ indent-blankline.lua
├─ init.lua
├─ lazygit.lua
├─ linting.lua
├─ lsp/
│ ├─ lspconfig.lua
│ └─ mason.lua
├─ lualine.lua
├─ nvim-cmp.lua
├─ nvim-tree.lua
├─ surround.lua
├─ substitute.lua
├─ telescope.lua
├─ todo-comments.lua
├─ treesitter.lua
├─ trouble.lua
├─ vim-maximizer.lua
└─ which-key.lua
```

**Theme Which I used = Kanagawa .nvim **
https://github.com/rebelot/kanagawa.nvim

I hated it almost throwed up on second day
so now I am using rose-pine theme for neovim

I modified it accordingly to my prefrences in **colorscheme.lua** file

1 Back up any old config

```
mv ~/.config/nvim ~/.config/nvim.backup
```

2 Clone this repo

```
git clone https://github.com/<your-user>/nvim-beginner-config.git ~/.config/nvim
```

3 Open Neovim – plugins install automatically

```
nvim

```
