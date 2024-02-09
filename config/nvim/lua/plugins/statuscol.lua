local function setup()
	local builtin = require("statuscol.builtin")
	local cfg = {
		-- Whether to set the 'statuscolumn' option, may be set to false for those who
		-- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
		-- Although I recommend just using the segments field below to build your
		-- statuscolumn to benefit from the performance optimizations in this plugin.
		-- builtin.lnumfunc number string options
		setopt = true,
		-- or line number thousands separator string ("." / ",")
		thousands = false,
		-- whether to right-align the cursor line number with 'relativenumber' set
		-- Builtin 'statuscolumn' options
		relculright = true,
		-- lua table with 'filetype' values for which 'statuscolumn' will be unset
		ft_ignore = nil,
		-- lua table with 'buftype' values for which 'statuscolumn' will be unset
		-- Default segments (fold -> sign -> line number + separator), explained below
		bt_ignore = nil,
		segments = {
			{
				text = { builtin.lnumfunc, " " },
				condition = { true, builtin.not_empty },
				click = "v:lua.ScLa",
			},
			{ text = { "%s" }, click = "v:lua.ScSa", auto = true },
			-- { text = { "%C" }, click = "v:lua.ScFa" },
		},
		clickmod = "c", -- modifier used for certain actions in the builtin clickhandlers:
		-- "a" for Alt, "c" for Ctrl and "m" for Meta.
		clickhandlers = { -- builtin click handlers
			Lnum = builtin.lnum_click,
			FoldClose = builtin.foldclose_click,
			FoldOpen = builtin.foldopen_click,
			FoldOther = builtin.foldother_click,
			DapBreakpointRejected = builtin.toggle_breakpoint,
			DapBreakpoint = builtin.toggle_breakpoint,
			DapBreakpointCondition = builtin.toggle_breakpoint,
			DiagnosticSignError = builtin.diagnostic_click,
			DiagnosticSignHint = builtin.diagnostic_click,
			DiagnosticSignInfo = builtin.diagnostic_click,
			DiagnosticSignWarn = builtin.diagnostic_click,
			GitSignsTopdelete = builtin.gitsigns_click,
			GitSignsUntracked = builtin.gitsigns_click,
			GitSignsAdd = builtin.gitsigns_click,
			GitSignsChange = builtin.gitsigns_click,
			GitSignsChangedelete = builtin.gitsigns_click,
			GitSignsDelete = builtin.gitsigns_click,
			gitsigns_extmark_signs_ = builtin.gitsigns_click,
		},
	}
	require("statuscol").setup(cfg)
end

local M = {
	"luukvbaal/statuscol.nvim",
	event = "BufReadPre",
	config = setup,
}

return M
