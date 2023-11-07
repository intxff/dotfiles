---@diagnostic disable-next-line: different-requires
local dap = require("dap")

-- take from nvim-dap-go
local function get_arguments()
	return coroutine.create(function(dap_run_co)
		local args = {}
		vim.ui.input({ prompt = "Args: " }, function(input)
			args = vim.split(input or "", " ")
			coroutine.resume(dap_run_co, args)
		end)
	end)
end

dap.adapters.go = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
	options = {
		initialize_timeout_sec = 20,
	},
}

dap.configurations.go = {
	{
		type = "go",
		name = "Debug Current File",
		request = "launch",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug With Arguments",
		request = "launch",
		program = "${file}",
		args = get_arguments,
	},
	{
		type = "go",
		name = "Attach",
		request = "attach",
		mode = "local",
		processId = require("dap.utils").pick_process,
	},
}
