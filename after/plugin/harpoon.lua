local harpoon = require 'harpoon'
harpoon:setup {
  settings = {
    save_on_toggle = true,
  },
}

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set('n', '<leader>e', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window with telescope' })

vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window default' })

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { desc = 'Add current file to harpoon list' })

local function set_navigation(number)
  vim.keymap.set('n', '<leader>' .. number, function()
    harpoon:list():select(number)
  end, { desc = 'Select file ' .. number .. ' in harpoon list' })
end

for i = 1, 9 do
  set_navigation(i)
end

vim.keymap.set('n', '<C-A-P>', function()
  harpoon:list():prev()
end, { desc = 'Go to previous file on list' })
vim.keymap.set('n', '<C-A-N>', function()
  harpoon:list():next()
end, { desc = 'Go to next file on list' })
