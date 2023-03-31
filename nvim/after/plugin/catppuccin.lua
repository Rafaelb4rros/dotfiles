  require "catppuccin".setup {
    color_overrides = {
        all = {
            base = "#000000",
        },
    },
    transparent_background = true 
  }

  vim.cmd [[colorscheme catppuccin]]
