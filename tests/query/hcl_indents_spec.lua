local Runner = require('tests.indent.common').Runner

local run = Runner:new(it, 'tests/query/indents/hcl', {
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
})

describe('indent HCL:', function()
  describe('whole file:', function()
    run:whole_file('.', { expected_failures = {} })
  end)
end)
