local ts = vim.treesitter

describe('HCL folds', function()
  it('folds multiline tuples and both comprehension forms', function()
    local source = [[
values = [
  "one",
  "two",
]
names = [for item in items :
  item.name
]
mapping = {for item in items :
  item.name => item.value
}
]]
    local root = ts.get_string_parser(source, 'hcl'):parse()[1]:root()
    assert.False(root:has_error())
    local query = ts.query.get('hcl', 'folds')
    local ranges = {}
    for _, node in query:iter_captures(root, source) do
      local start_row, _, end_row = node:range()
      ranges[#ranges + 1] = { start_row, end_row }
    end
    assert.same({ { 0, 3 }, { 4, 6 }, { 7, 9 } }, ranges)
  end)

  it('folds multiline function calls, including nested calls', function()
    local source = [[
values = concat(
  local.first,
  flatten(
    local.nested,
  ),
)
]]
    local root = ts.get_string_parser(source, 'hcl'):parse()[1]:root()
    assert.False(root:has_error())
    local query = ts.query.get('hcl', 'folds')
    local ranges = {}
    for _, node in query:iter_captures(root, source) do
      local start_row, _, end_row = node:range()
      ranges[#ranges + 1] = { start_row, end_row }
    end
    assert.same({ { 0, 5 }, { 2, 4 } }, ranges)
  end)
end)
