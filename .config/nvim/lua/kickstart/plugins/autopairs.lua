-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local npairs = require 'nvim-autopairs'
    npairs.setup { map_cr = false }

    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'
    npairs.add_rules {
      Rule('<%', ' %>', 'eruby'):with_pair(cond.not_after_text '='):set_end_pair_length(3),
    }
  end,
}
