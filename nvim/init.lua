local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/which-key.nvim",
	},
	{
		"lalitmee/cobalt2.nvim",
		event = { "ColorSchemePre" }, -- if you want to lazy load
		dependencies = { "tjdevries/colorbuddy.nvim" },
		init = function()
			require("colorbuddy").colorscheme("cobalt2")
		end,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
})

require("colorbuddy").colorscheme("cobalt2")
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettier" } },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

local function setup_config()
	-- Auto close pairs
	local autoclose_pairs = {
		["{"] = "}",
		["<"] = ">",
		["["] = "]",
		["("] = ")",
		['"'] = '"',
		["'"] = "'",
	}

	for key, value in pairs(autoclose_pairs) do
		vim.api.nvim_set_keymap("i", key, key .. value .. "<LEFT>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap(
			"v",
			key,
			'"zdi' .. key .. value .. "<C-R>z" .. key .. value .. "<ESC>",
			{ noremap = true, silent = true }
		)
	end

	-- Move buffers
	vim.api.nvim_set_keymap("n", "<C-Tab>", ":bprevious<cr>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { noremap = true, silent = true })

	-- Clean highlighting
	vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":<C-u>noh<Return>", { noremap = true, silent = true })

	-- Search with /
	vim.api.nvim_set_keymap("n", "<space>", "/", { noremap = true, silent = true })

	-- Emacs keybindings in insert mode and command mode
	local emacs_keys = {
		["<C-p>"] = "<Up>",
		["<C-n>"] = "<Down>",
		["<C-b>"] = "<Left>",
		["<C-f>"] = "<Right>",
		["<C-e>"] = "<End>",
		["<C-a>"] = "<Home>",
		["<C-h>"] = "<Backspace>",
		["<C-d>"] = "<Del>",
	}

	for key, value in pairs(emacs_keys) do
		vim.api.nvim_set_keymap("i", key, value, { noremap = true, silent = true })
		vim.api.nvim_set_keymap("c", key, value, { noremap = true, silent = true })
	end

	-- Additional Emacs bindings
	vim.api.nvim_set_keymap("i", "<C-u>", "<C-o>d0", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("i", "<C-k>", "<C-o>D", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("c", "<C-u>", "<C-U>", { noremap = true, silent = true })

	-- FZF binding
	vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<cr>", { noremap = true, silent = true })

	-- Search Settings
	vim.opt.hlsearch = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.incsearch = true

	-- Matching Settings
	vim.opt.showmatch = true
	vim.opt.matchtime = 1

	-- Status Line Settings
	vim.opt.showcmd = true
	vim.opt.cmdheight = 1
	vim.opt.laststatus = 2
	vim.opt.statusline = "%f%m%r%h%w %=%l,%v|%p%%"
	vim.opt.ambiwidth = "double"

	-- Tab and Indentation Settings
	vim.opt.softtabstop = 2
	-- vim.opt.tabstop = 2  -- Commented out in the original, so it's commented here too.
	vim.opt.shiftwidth = 2
	vim.opt.smartindent = true
	vim.opt.autoindent = true
	vim.opt.expandtab = true

	-- Miscellaneous Settings
	vim.opt.backup = false
	--vim.opt.swap = false
	vim.opt.title = true
	vim.opt.number = true
	vim.opt.whichwrap:append("h,l")
	vim.opt.scrolloff = 3
	vim.opt.display = "lastline"
	vim.opt.hidden = true

	-- FZF
	vim.api.nvim_set_keymap("n", "<C-p>", ":FzfLua files<cr>", { noremap = true, silent = true })
	-- https://github.com/qvacua/vimr/issues/972#issuecomment-1435115444
	vim.env.FZF_LUA_NVIM_BIN = "nvim"

	-- Netrw
	vim.g.netrw_list_hide = ".*\\.o$\\|.*\\.hi$\\|^\\.DS_Store$"

	-- Setting wildignore
	vim.opt.wildignore = { "*.o", "*.hi" }

	-- Set up the highlight groups
	local highlights = {
		{ name = "CommaAndNonSpace", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "EOLSpace", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "HashRocketAndNonSpace", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "NonSpaceAndHashRocket", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "SpaceAndComma", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "Tab", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "WideEisuu", ctermbg = "red", guifg = "white", guibg = "red" },
		{ name = "WideSpace", ctermbg = "red", guifg = "white", guibg = "red" },
	}

	for _, hl in ipairs(highlights) do
		vim.cmd(string.format("highlight %s ctermbg=%s guifg=%s guibg=%s", hl.name, hl.ctermbg, hl.guifg, hl.guibg))
	end

	-- Function to apply the general checkstyles
	local function highlight_general_checkstyles()
		local matches = {
			{ hlgroup = "WideSpace", pattern = "　" },
			{ hlgroup = "EOLSpace", pattern = "\\s\\+$" },
			{ hlgroup = "WideEisuu", pattern = "[Ａ-Ｚａ-ｚ０-９]" },
		}

		for _, match in ipairs(matches) do
			vim.fn.matchadd(match.hlgroup, match.pattern, -1)
		end
	end

	-- Call the function to apply the highlights
	highlight_general_checkstyles()
end

setup_config()
