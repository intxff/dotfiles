local function setup()
	vim.g.completeopt = "menu, menuone, noselect"

	local cmp = require("cmp")
	local luasnip = require("luasnip")

	cmp.setup({
		preselect = cmp.PreselectMode.None,
		view = {
			entries = { name = "custom", selection_order = "near_cursor" },
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = {
				border = "rounded",
			},
			documentation = {
				border = "rounded",
			},
		},
		formatting = {
			---@diagnostic disable-next-line: different-requires
			format = require("lspkind").cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
				menu = {
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[Snip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				},
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = false }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "nvim_lsp_signature_help" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "nvim_lsp_document_symbol" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

local M = {
	"hrsh7th/nvim-cmp",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim",
	},
	config = setup,
}

return M
