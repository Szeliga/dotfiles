local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local function capitalize(str)
  -- uppercase first character.
  return str:gsub("^.", string.upper)
end

local function pascalcase(str)
  local pascalcased = ""
  for match in str:gmatch("[a-zA-Z0-9]+") do
    pascalcased = pascalcased .. capitalize(match)
  end
  return pascalcased
end

local filename = function()
  return f(function(_args, snip)
    local name = vim.split(snip.snippet.env.TM_FILENAME, ".", true)[1] or ""
    return pascalcase(name)
  end)
end

ls.add_snippets("ruby", {
  s("422failure", {
    t({
      "in Failure[:invalid_payload, Dry::Validation::Result => err]",
      "  render(json: Qonto::Controller::Addons::ValidationError.new(err).as_json, status: 422)"
    }),
  }),
})
