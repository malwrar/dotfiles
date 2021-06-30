" Modular neovim config by malwrar

" TODO: use custom theme
colorscheme malwrar

" Respond to mouse interactions
set mouse=a

" Show line numbers
set number

" Set leader keys
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Reduce timeout from 1000 to 500 to make whichkey menu more responsive
set timeoutlen=500

" Reduce time it takes for CursorHold to trigger
set updatetime=500

" Set default text preferences
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set smartcase
set smartindent
set smarttab

" Start by specifying plugins
call plug#begin(stdpath('data') . '/plugged')

" Replace the default neovim front page.
Plug 'mhinz/vim-startify'

" Autocompletion popup
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ncm2/float-preview.nvim'

" Language server stuff + autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'simrat39/rust-tools.nvim'
Plug 'Shougo/deoplete-lsp'

" Snippets + autocomplete
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

" Pretty visual tool for finding stuff, powers most of the <leader>f features
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

" Pops up a little shortcut helper prompt like in spacemacs
Plug 'liuchengxu/vim-which-key'

" Use fancy icons (if installed) for several plugins
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()



" TODO: set up:
"   * Filetype-specific stuff (2 spaces for yaml, json, etc)
"   * Snippets
"   * Ansible snippets?
" 
" After that, ansible autoinstall + splitting config files. no need to do that tho, just finish up the above then work on understanding rendy + getting it working with xcb

set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:float_preview#docked = 0
let g:float_preview#max_width = 80

" Configure floating preview window
function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

autocmd User FloatPreviewWinOpen call DisableExtras()

" Register space (leader) as which_key trigger
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Use which_key for leader-based shortcuts.
let g:which_key_map = {}

" Don't show statusbar in which_key buffer
 autocmd! FileType which_key
 autocmd  FileType which_key set laststatus=0 noshowmode noruler
   \ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map.t = {
  \   'name' : '+toggle',
  \   't' : ['NERDTreeToggle', 'tree'],
  \ }

let g:which_key_map.f = {
  \   'name' : '+find',
  \   't' : [':Telescope live_grep',                'text'],
  \   'f' : [':Telescope find_files',               'file'],
  \   'b' : [':Telescope buffers',                  'buffer'],
  \   'm' : [':Telescope marks',                    'marks'],
  \   'M' : [':Telescope map_pages',                'man-page'],
  \   'r' : [':Telescope lsp_references',           'lsp-references'],
  \   's' : [':Telescope lsp_document_symbols',     'lsp-symbols'],
  \   'e' : [':Telescope lsp_document_diagnostics', 'lsp-errors'],
  \ }

"let g:which_key_map.s = {
"  \   'name' : '+session',
"  \   's' : ['SessionSave',     'save'],
"  \   'l' : ['SessionLoad',     'load'],
"  \ }

" Put NERDTree on the right side, not left
let g:NERDTreeWinPos = "right"

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd TabEnter * NERDTreeMirror

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" Configure telescope
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

" Configure nvim-lspconfig
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- Configure diagnostics visualization
  vim.lsp.handlers["textdocument/publishdiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Enable underlines
      underline = true,
      -- Enable symbols in sign column
      sign = true,
      -- Keep updating while we're writing stuff
      update_in_insert = true,
      -- But for the love of god remove that eyesore warning text
      virtual_text = false,
    }
  )

end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end

-- Ensure annoying diagnostics are disabled
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Use the language server to replace a few stock operations.
nnoremap <silent>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>

" TODO: move to theme
sign define LspDiagnosticsSignError text=E texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=W texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=

hi! link LspDiagnosticsDefaultError Red
hi! link LspDiagnosticsDefaultWarning Yellow
hi! link LspDiagnosticsDefaultInformation Blue
hi! link LspDiagnosticsDefaultHint Aqua

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
