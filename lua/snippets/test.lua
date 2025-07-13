local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node
--
-- ls.add_snippets("lua", {
-- 	s("ret", {
-- 		t("return {"),
-- 		t({ "", "  " }),
-- 		i(1),
-- 		t({ "", "}" }),
-- 	}),
-- })
--

-- Another snippet.
--
--rreturn 
--return rr
--
-- return 
-- return rr 

ls.add_snippets("all", {
    s("rr", {
        t("return "),
    }),
})

-- return {
-- 	ls.snippet({ trig = "rr", dscr = "Pastes `return` keyword" }, {
-- 		t("return"),
-- 	}),
-- }
