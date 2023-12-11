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
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = true,
			})
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "mfussenegger/nvim-dap" },
	{ "leoluz/nvim-dap-go" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = { position = "top", mode = "document_diagnostics", auto_open = true, auto_close = true },
	},
	{ "lewis6991/gitsigns.nvim" },
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

local dap = require("dap")
dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = "dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}

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
	vim.api.nvim_set_keymap("n", "-", ":Explore<cr>", { noremap = true, silent = true })

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

	vim.api.nvim_set_keymap("i", "<Tab>", "<C-x><C-o>", { noremap = true, silent = true })

	-- FZF binding
	vim.api.nvim_set_keymap("n", "<C-p>", ":FZF<cr>", { noremap = true, silent = true })

	local set_keymap = vim.api.nvim_set_keymap

	local opts = { noremap = true, silent = true }

	-- Terminal mode mappings
	set_keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", opts)
	set_keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", opts)
	set_keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", opts)
	set_keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", opts)

	-- Insert mode mappings
	set_keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
	set_keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
	set_keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
	set_keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)

	-- Normal mode mappings
	set_keymap("n", "<A-h>", "<C-w>h", opts)
	set_keymap("n", "<A-j>", "<C-w>j", opts)
	set_keymap("n", "<A-k>", "<C-w>k", opts)
	set_keymap("n", "<A-l>", "<C-w>l", opts)

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
	-- vim.opt.tabstop = 2 -- Commented out in the original, so it's commented here too.
	vim.opt.shiftwidth = 2
	vim.opt.smartindent = true
	vim.opt.autoindent = true
	vim.opt.expandtab = true

	-- Miscellaneous Settings
	vim.opt.backup = false
	vim.opt.swapfile = false
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
require("mason").setup()
require("mason-lspconfig").setup()

vim.cmd("source ~/.config/nvim/characterspacing.vim")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

local lspconfig = require("lspconfig")
local gopls_on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
lspconfig.gopls.setup({
	on_attach = gopls_on_attach,
})
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})
vim.cmd([[ command! NeotestRun :lua require('neotest').run.run() ]])
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
local function on_cursor_hold()
	if vim.lsp.buf.server_ready() then
		vim.diagnostic.open_float()
	end
end

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
vim.api.nvim_set_option("updatetime", 500)
vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })
require("gitsigns").setup()
