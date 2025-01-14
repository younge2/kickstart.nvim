local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('all', {
  s('erb', {
    t '<%',
    i(1),
    t ' %>',
  }),
  s('erbb', {
    t '<%= ',
    i(1),
    t ' %>',
  }),
})

ls.add_snippets('lua', {
  s('test', {
    t 'test',
  }),
})
