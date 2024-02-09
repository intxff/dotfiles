local M = {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "<leader>c",
			block = "<leader>b",
		},
		opleader = {
			line = "<leader>c",
			block = "<leader>b",
		},
	},
	ft = "",
}

function M:config(code)
	M.ft = code
	return M
end

return M
