# builder_cpp.nvim

builder_cpp integration into neovim
[Builder_cpp](https://github.com/Dr-42/builder_cpp)

## Installation

### Packer
```lua
use ("Dr-42/builder_cpp.nvim")
```

## Configuration

It is useful to remap keybindings
Example:
```lua

vim.keymap.set('n', '<leader>bb', require('builder_cpp').build, { desc = '[B]uilder_cpp [B]uild' })
vim.keymap.set('n', '<leader>br', require('builder_cpp').run, { desc = '[B]uilder_cpp [R]un' })
vim.keymap.set('n', '<leader>bc', require('builder_cpp').clean, { desc = '[B]uilder_cpp [C]lean' })
vim.keymap.set('n', '<leader>bbr', require('builder_cpp').build_run, { desc = '[B]uilder_cpp [B]uild [R]un' })
vim.keymap.set('n', '<leader>bcbr', require('builder_cpp').cleaan_build_run,  { desc = '[B]uilder_cpp [C]lean [B]uild [R]un' })
```

## Contributing

Feel free to make any pull requests
