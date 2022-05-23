local target_path = vim.fn.expand('~/.undodir')

if vim.fn.isdirectory(target_path) == false then
    vim.call(vim.fn.mkdir(target_path, "p", 0700))
end

vim.cmd("set undodir", target_path)
