local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
require "paq" {
	"savq/paq-nvim";
	"NLKNguyen/papercolor-theme";
	"artanikin/vim-synthwave84";
	{"shougo/deoplete.nvim", run = fn["remote#host#UpdateRemotePlugins"]};
	"nvim-treesitter/nvim-treesitter";
	"kyazdani42/nvim-web-devicons";
	"kyazdani42/nvim-tree.lua";
	"xiyaowong/nvim-transparent";
}
g['deoplete#enable_at_startup'] = 1
g['python3_host_prog'] = "/usr/bin/python3"
g['loaded_python_provider'] = 0
g['c_syntax_for_h'] = 1

opt.termguicolors	= true
cmd 'colorscheme PaperColor'
cmd 'syntax on'
opt.compatible		= false
opt.background		= 'dark'
opt.number			= true
--opt.relativenumber 	= true
opt.shiftround		= true
opt.tabstop			= 4
opt.shiftwidth		= 0
opt.softtabstop		= -1
opt.wrap			= true
opt.linebreak		= true
opt.showbreak		= '+++'
opt.autoindent		= true
opt.expandtab		= false
opt.cursorline		= true
opt.filetype		= 'on'
opt.mouse			= 'a'


local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = {"c", "lua", "python", "bash"}, highlight = {enable = true}}

require'transparent'.setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

require'nvim-web-devicons'.setup()
require'nvim-tree'.setup{
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
}



vim.api.nvim_set_keymap('n', '<leader>tt', ':term<CR>i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>TT', ':vsp<CR><C-w><right>:term<CR>i', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vr', ':e $MYVIMRC<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><space>', ':let @/=""<CR>', { noremap = true, silent = true})


vim.api.nvim_set_keymap('n', '<leader>to', ':NvimTreeOpen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tc', ':NvimTreeClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tr', ':NvimTreeFocus<CR>', { noremap = true, silent = true})

