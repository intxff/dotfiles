-- change dap signature
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "blue", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "blue", linehl = "", numhl = "" })

require("dapui").setup()
---@diagnostic disable-next-line: different-requires
local dap = require("dap")
local dapui = require("dapui")

-- record buf_id when toggle to dap ui
local cur_buf = 0

-- keymaps
local keymaps = {
	toggle_break = {
		"n",
		"<F1>",
		function()
			dap.toggle_breakpoint()
		end,
	},
	coroutine = {
		"n",
		"<F2>",
		function()
			dap.continue()
		end,
	},
	next = {
		"n",
		"<F3>",
		function()
			dap.step_over()
		end,
	},
	step_into = {
		"n",
		"<F4>",
		function()
			dap.step_into()
		end,
	},
	step_out = {
		"n",
		"<F5>",
		function()
			dap.step_out()
		end,
	},
	pause = {
		"n",
		"<F9>",
		function()
			dap.pause()
		end,
	},
	close = {
		"n",
		"<F10>",
		function()
			dap.close()
		end,
	},
	terminate = {
		"n",
		"<F11>",
		function()
			dap.terminate()
		end,
	},
	close_ui = {
		"n",
		"<F12>",
		function()
			dapui.close()
			if cur_buf ~= 0 then
				vim.api.nvim_win_set_buf(0, cur_buf)
				cur_buf = 0
			end
		end,
	},
}

local map = vim.keymap
for _, keymap in pairs(keymaps) do
	map.set(unpack(keymap))
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	cur_buf = vim.api.nvim_win_get_buf(0)
	dapui.open()
end
