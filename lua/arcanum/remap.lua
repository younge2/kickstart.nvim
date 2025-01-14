vim.g.mapleader = ' '
vim.keymap.set('i', 'qq', '<Esc>', { desc = 'quits insert to normal mode' })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })
