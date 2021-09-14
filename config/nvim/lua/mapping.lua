-- Map function for easier key re-mapping.
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General mappings
map('', '<leader>c', '"+y')             -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')        -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')        -- Make <C-w> undo-friendly
map('n', '<C-l>', '<cmd>noh<CR>')       -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')     -- Insert a newline in normal mode

-- Plugin mappings
--
-- Completion (lsp)
-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- FileTree
--
map('', '<C-b>', '<cmd>NvimTreeToggle<CR>')
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>
