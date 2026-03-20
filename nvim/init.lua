-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

--create a function  to put current window in full screen
--Put current window in new tab
--swap to windows in current tab.
--
vim.opt.termguicolors = true

--Basic
vim.opt.number=true
vim.opt.relativenumber=true

vim.opt.cursorline=true

-- Lines below/above the cursor
vim.opt.scrolloff=10

--Indentation and tabs
-- How many spaces a <Tab> character displays as.
-- (Purely visual — doesn’t change file content)
vim.opt.tabstop = 2

-- How many spaces a <Tab> or <BS> (backspace) counts for while editing.
-- It "feels" like you're inserting tabs of 2 spaces, but with 'expandtab'
-- it will insert actual spaces or tabs.
vim.opt.softtabstop = 2

-- Pressing Tab inserts spaces instead of <Tab> character.
vim.opt.expandtab = true

-- Number of spaces used for each step of (auto)indent.
vim.opt.shiftwidth = 2

-- Indent 
vim.keymap.set('n', '<C-S-I>', 'gg=G', { desc = 'Indent entire file' })


--Search

-- By default, searching is case sensitive. We need to change it
vim.opt.ignorecase=true

-- When we want to apply a case sensitive search, we type a upper case letter in the search.
vim.opt.smartcase=true

vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search


-- When we we type a ) or ], The cursor will go to the matching  ) for some tenths of second
vim.opt.showmatch=true

-- This time will be 2 tenths of second.
vim.opt.matchtime=2



--LEADER KEY

--Use space al leader
vim.g.mapleader = " "

----Use space as local leader. It's like leader but applies to a buffer.
vim.g.maplocalleader=" "





--Key masp


-- Window split
vim.keymap.set("n","<leader>b%",":vsplit<CR>",{desc ="Split window vertically"})

vim.keymap.set("n",'<leader>b"',":split<CR>",{desc ="Split window horizontally"})


--We use C-\ C-o to tell the terminal that we want to run one command in normal mode
-- is \\ instead of \, because \ is interpretated as special character by lua
--Open terminal at the top down 

--vim.keymap.set("n", "<A-t>", ":botright split|  resize 5 | term <CR>i", { desc = "Open terminal at the top down" })

--Window size

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Save file
vim.keymap.set("n", "<C-S>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-S>", "<C-\\><C-o>:w<CR>", { desc = "Save file" })

--Exit
vim.keymap.set("i", "<C-W>", "<C-\\><C-o>:q<CR>", { desc = "Exit" })
vim.keymap.set("n", "<C-W>", "<C-\\><C-n>:<CR>", { desc = "Exit" })

-- Move lines up/down
--vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
--vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
--vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
--vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- File navigation
vim.keymap.set("n", "<A-e>", ":Lexplore | vertical resize 20 <CR>", { desc = "Open file explorer at the left size" })
--Find file
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

--Use system clipboard
vim.opt.clipboard:append("unnamedplus")


vim.opt.showtabline = 2  -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
--vim.opt.tabline = ''     -- Use default tabline (empty string uses built-in)


-- Alternative navigation (TMUX config) 
vim.keymap.set('n', '<leader>bc', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>b&', ':tabclose<CR>', { desc = 'Close tab' })

-- Tab moving
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })
-- Move buffer to new window 
vim.keymap.set('n', '<leader>b!', '<C-w>T', { noremap = true, silent = true })

vim.keymap.set('n', '<A-1>', '1gt', { noremap = true  })
vim.keymap.set('n', '<A-2>', '2gt', { noremap = true  })
vim.keymap.set('n', '<A-3>', '3gt', { noremap = true  })
vim.keymap.set('n', '<A-4>', '4gt', { noremap = true  })
vim.keymap.set('n', '<A-5>', '5gt', { noremap = true  })
vim.keymap.set('n', '<A-6>', '6gt', { noremap = true  })
vim.keymap.set('n', '<A-7>', '7gt', { noremap = true  })
vim.keymap.set('n', '<A-8>', '8gt', { noremap = true  })
vim.keymap.set('n', '<A-9>', '9gt', { noremap = true  })
vim.keymap.set('n', '<A-10>', '10gt', { noremap = true})

vim.keymap.set('i', '<A-1>', '<C-\\><C-o>1gt', { noremap = true })
vim.keymap.set('i', '<A-2>', '<C-\\><C-o>2gt', { noremap = true })
vim.keymap.set('i', '<A-3>', '<C-\\><C-o>3gt', { noremap = true })
vim.keymap.set('i', '<A-4>', '<C-\\><C-o>4gt', { noremap = true })
vim.keymap.set('i', '<A-5>', '<C-\\><C-o>5gt', { noremap = true })
vim.keymap.set('i', '<A-6>', '<C-\\><C-o>6gt', { noremap = true })
vim.keymap.set('i', '<A-7>', '<C-\\><C-o>7gt', { noremap = true })
vim.keymap.set('i', '<A-8>', '<C-\\><C-o>8gt', { noremap = true })
vim.keymap.set('i', '<A-9>', '<C-\\><C-o>9gt', { noremap = true })
vim.keymap.set('i', '<A-10>','<C-\\><C-o>10gt', { noremap = true })


vim.cmd.colorscheme('elflord')

local openCmdOutInBuffer = function(opts)
  local output = vim.fn.execute(opts.fargs[1])
  vim.cmd("tabnew")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

vim.api.nvim_create_user_command("Cob", openCmdOutInBuffer, {
  desc = "Open a command output in a new buffer",
  nargs = 1
})

-- PLUGINS
require("lazy").setup({
  spec = {
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" }, },
      },
      {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config= function ()
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
          vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
          vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end	
      },
        {
          "L3MON4D3/LuaSnip",
          -- follow latest release.
          version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest releas
          -- install jsregexp (optional!).
          build = "make install_jsregexp"
        },
        {
          "nvim-tree/nvim-tree.lua",
          version = "*",
          lazy = false,
          dependencies = {
            "nvim-tree/nvim-web-devicons",
          },
          config = function()
            local config={
              hijack_netrw=false
            }
            require("nvim-tree").setup(config)
          end,
        },
      ---@type LazySpec
      {
        "mikavilpas/yazi.nvim",
        version = "*", -- use the latest stable version
        event = "VeryLazy",
        dependencies = {
          { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
          -- 👇 in this section, choose your own keymappings!
          {
            "<leader>e.",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
          },
          {
            -- Open in the current working directory
            "<leader>ew",
            "<cmd>Yazi cwd<cr>",
            desc = "Open the file manager in nvim's working directory",
          },
          {
            "<leader>er",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
          },
        },
        ---@type YaziConfig | {}
        opts = {
          -- if you want to open yazi instead of netrw, see below for more info
          open_for_directories = true,
          keymaps = {
            show_help = "<f1>",
          },
        },
        -- 👇 if you use `open_for_directories=true`, this is recommended
        init = function()
          -- mark netrw as loaded so it's not loaded at all.
          --
          -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
          vim.g.loaded_netrwPlugin = 1
        end,
      },
      {
        "neovim/nvim-lspconfig",
      },
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      },
      {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate'
      },
      {
          "mason-org/mason-lspconfig.nvim",
          opts = {
            ensure_installed = { "lua_ls","bashls","dockerls", "yamlls" },
            automatic_enable = {
             exclude = { "lua_ls","bashls","dockerls","yamlls"}
           }
          },
          dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
          },
        },
      {
        'vimpostor/vim-tpipeline'

      }
      ,
      
      {
        "mfussenegger/nvim-jdtls"

      }


    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false},
  })

-- snippets config
vim.cmd[[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

]]

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})


--- TREESITTER
require'nvim-treesitter'.install { 'yaml','bash' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml' },
  callback = function() vim.treesitter.start() end,
})



--- LSP
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
  callback = function() vim.lsp.enable('lua_ls') end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'bash','sh' },
  callback = function() 
    vim.lsp.enable('bashls')
    vim.lsp.enable('shellcheck')

  end,
})



vim.lsp.config("jdtls", {
  settings = {
    java = {
        -- Custom eclipse.jdt.ls options go here
    },
  },
})
vim.lsp.enable("jdtls")
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'java' },
  callback = function()
    require('jdtls').start_or_attach({})
  end,
})


--- ENVIRONMENT VARIABLES
vim.env.lazy="/home/julio/.local/share/nvim/mason"
vim.env.obs="/home/julio/Documents/COMP"
vim.env.pdg="/home/julio/Documents/COMP/PDG"

