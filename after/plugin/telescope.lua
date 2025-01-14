local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>pg', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)
