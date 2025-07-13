local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local extras = require("luasnip.extras")
local rep = extras.rep

-- Function to get filename in camelCase
local function filename_to_camelcase(args, parent)
    local filename = vim.fn.expand("%:t:r") -- Get filename without extension
    
    -- Convert to camelCase
    -- First capitalize each word
    local camelCase = filename:gsub("[_-](%w)", function(c) return c:upper() end)
    -- Then ensure first letter is capitalized (PascalCase for component names)
    camelCase = camelCase:gsub("^%l", string.upper)
    -- Remove any remaining underscores or hyphens
    camelCase = camelCase:gsub("[_-]", "")
    
    return camelCase
end

-- Vue component snippet
ls.add_snippets("all", {
    s("comp", {
        t("export const "),
        f(filename_to_camelcase, {}),
        t(" = defineComponent({"),
        t({"", "    render() {", "        return (", "            "}),
        i(1),
        t({"", "        )", "    }", "})"}),
    })
})
