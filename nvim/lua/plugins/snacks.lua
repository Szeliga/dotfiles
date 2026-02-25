return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      input = {},
      picker = {},
      terminal = {},
      gitbrowse = {
        remote_patterns = {
          -- Custom: github-work SSH alias → GitHub URL
          { "^github%-work:(.+)%.git$", "https://github.com/%1" },
          { "^github%-work:(.+)$",     "https://github.com/%1" },
          -- Defaults from snacks.nvim
          { "^(https?://.*)%.git$"              , "%1" },
          { "^git@(.+):(.+)%.git$"              , "https://%1/%2" },
          { "^git@(.+):(.+)$"                   , "https://%1/%2" },
          { "^git@(.+)/(.+)$"                   , "https://%1/%2" },
          { "^org%-%d+@(.+):(.+)%.git$"         , "https://%1/%2" },
          { "^ssh://git@(.*)$"                  , "https://%1" },
          { "^ssh://([^:/]+)(:%d+)/(.*)$"       , "https://%1/%3" },
          { "^ssh://([^/]+)/(.*)$"              , "https://%1/%2" },
          { "ssh%.dev%.azure%.com/v3/(.*)/(.*)$", "dev.azure.com/%1/_git/%2" },
          { "^https://%w*@(.*)"                 , "https://%1" },
          { "^git@(.*)"                         , "https://%1" },
          { ":%d+"                              , "" },
          { "%.git$"                            , "" },
        },
      },
    }
  }
}
