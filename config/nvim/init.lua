-- init.lua
--
-- Load the plugins and plugin configuration (plugins.*)
require('plugins')
require('plugins.filetree')
require('plugins.dashboard')
require('plugins.treesitter')

-- Load the lsp
require('lsp')

-- Load the neovim configuration
require('config')
require('mapping')
