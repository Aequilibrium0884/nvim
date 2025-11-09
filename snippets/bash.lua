local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add.snippets("bash", {
	s("td", {
		t("if [[ -d "),
		i(1, "dir"),
		t("]] then\n"),
		i(2, "execute"),
		t("\nif"),
	}),
})
