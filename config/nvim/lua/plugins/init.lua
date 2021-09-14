require 'paq-nvim' {
    'savq/paq-nvim';                    -- Let Paq manage itself

    -- Appearance
    'glepnir/dashboard-nvim';           -- Nice looking dashboard
    'folke/tokyonight.nvim';            -- Beautiful colorscheme
    'nvim-treesitter/nvim-treesitter';  -- Better colors & syntax highlighting
	'kyazdani42/nvim-web-devicons'; 	-- Some nice looking icons
	'kyazdani42/nvim-tree.lua';			-- FileTree 

    -- Comment out with gc or gcc
    'tpope/vim-commentary';

    -- LSP
    'neovim/nvim-lspconfig';
    'nvim-lua/lsp_extensions.nvim';
    'kabouzeid/nvim-lspinstall';

    -- Completion and snippets
    'nvim-lua/completion-nvim';
    'norcalli/snippets.nvim';

    -- Telescope
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
}
-- Everytime nvim get's opened, paq will install, update and clean the updates.
:install()
:update()
:clean()
