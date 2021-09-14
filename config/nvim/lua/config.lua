-- lua/config
--
-- All the configuration is strictly put in here.
-- This file get's invoked via the init.lua file in the nvim root dir.
--
local cmd, opt, g = vim.cmd, vim.opt, vim.g

do -- General
    opt.ignorecase = true
    opt.smartcase = true
    opt.clipboard = 'unnamedplus'
    opt.title = true
    opt.inccommand = 'nosplit'
    opt.mouse = 'a'
    opt.cursorline = true
    opt.lazyredraw = true
    opt.linebreak = false
    opt.hidden = true                   -- Enable background buffers
    opt.joinspaces = false              -- No double spaces with join
    opt.list = true                     -- Show some invisible characters
    opt.scrolloff = 4                   -- Lines of context
    opt.shiftround = true               -- Round indent
    opt.shiftwidth = 4                  -- Size of an indent
    opt.sidescrolloff = 8               -- Columns of context
    opt.smartindent = true              -- Insert indents automatically
    opt.splitbelow = true               -- Put new windows below current
    opt.splitright = true               -- Put new windows right of current
    opt.wildmode = {'list', 'longest'}  -- Command-line completion mode

    -- define tabs / spaces
    opt.tabstop = 4
	opt.shiftwidth = 4
    opt.expandtab = false
end

do -- Appearance
    opt.number = true                   -- show linenumbers
    opt.relativenumber = true           -- show relative line numbers
    opt.termguicolors = true            -- use terminal colorscheme
    opt.wrap = false                    -- Disable line wrap

    -- Colorscheme
    -- https://github.com/folke/tokyonight.nvim
    g.tokyonight_style = "night"
    g.tokyonight_colors = { hint = "orange", error = "#ff0000" }    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    cmd[[colorscheme tokyonight]]       -- enable the colorscheme
end

do -- Completion
    opt.completeopt = {'menuone', 'noinsert', 'noselect'}
    cmd [[set shortmess+=c]]
    g.completion_confirm_key = ""
    g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
end


