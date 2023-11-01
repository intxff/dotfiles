require("dapui").setup()
---@diagnostic disable-next-line: different-requires
local dap = require("dap")
local dapui = require("dapui")

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
		end,
	},
}

local map = vim.keymap
for _, keymap in pairs(keymaps) do
	map.set(unpack(keymap))
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
