-- local util = require("vim.lsp.util")

-- golang lint
local golint_command = "golangci-lint run --color never --out-format tab --disable-all"
local linters = {
	"errcheck",
	"gosimple",
	"govet",
	"ineffassign",
	"staticcheck",
	"unused",
}
local t = ""
for _, value in pairs(linters) do
	t = t .. " -E " .. value
end
local golang_lint = {
	prefix = "lint",
	lintCommand = golint_command .. t,
	lintWorkspace = true,
	lintStdin = false,
	lintFormats = { "%f:%l:%c%*[ ]%m" },
}

-- spell checker
local spell_lint = {
	prefix = "spell",
	lintCommand = "cspell lint --no-color --no-progress --no-summary stdin://${INPUT}",
	lintIgnoreExitCode = false,
	lintStdin = true,
	lintFormats = { "%f:%l:%c - %m", "%f:%l:%c %m" },
	-- cspell does not use any severity levels, use INFO level by default
	lintSeverity = 3,
}

local matcher = {
	go = {
		golang_lint,
	},
}

for _, lang in pairs(matcher) do
	table.insert(lang, spell_lint)
end

require("lspconfig").efm.setup({
	init_options = { documentFormatting = false },
	settings = {
		rootMarkers = { ".git/" },
		languages = matcher,
	},
})
