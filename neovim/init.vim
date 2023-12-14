scriptencoding utf-8
set encoding=utf-8

"-------------------Load files-----------------
source ~/.config/nvim/plugins.vim

"----------------------------------------------------------------------
" Basic Options
"----------------------------------------------------------------------
let mapleader = ";"       " The <leader> key
set autoread              " Reload files that have not been modified
set colorcolumn=100       " Highlight 100 character limit
set laststatus=2          " Always show the status bar
set number                " Enable line numbers
set hidden                " https://medium.com/usevim/vim-101-set-hidden-f78800142855
set title                 " Sets the title of the window
set ruler                 " Show the line number and column in the status bar
set scrolloff=999         " Keep the cursor centered in the screen
set showmatch             " Highlight matching braces
set showmode              " Show the current mode on the open buffer
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set mouse=                " Disables the mouse

" suppress error bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Customize session options, don't save hidden and unloaded buffers or empty windows.
set sessionoptions="curdir,folds,help,options,tabpages,winsize"

if !has("win32")
    set showbreak=↪           " The character to put to show a line has been wrapped
end

syntax on                 " Enable filetype detection by syntax

" disable backup files
set directory=$HOME/.config/nvim/swp/
set nobackup              " Disable backup files
set nowb

" Search settings
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set smartcase  " Be smart about case sensitivity when searching


" Tab settings
set tabstop=4             " Show existing tab with 4 spaces width
set softtabstop=4         " Indent by 4 spaces when hitting tab
set shiftwidth=4          " Indent by 4 spaces when auto-indenting
set expandtab             " Expand tabs to the proper type and size

" Tab completion settings
set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.swp         " Ignore vim backups

" GUI settings

" This is required to force 24-bit color since I use a modern terminal.
set termguicolors

" netrw settings
let g:netrw_banner = 0        " Suppress the banner

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let g:airline_theme='molokai'

" molokai settings

let g:rehash256 = 1
" let g:molokai_original = 1
colorscheme molokai

" set colorcolumn=100

" highlight ColorColumn ctermbg=238 guibg=#23272

" end molokai settings

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk

" Make navigating around splits easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
if has('nvim')
  " We have to do this to fix a bug with Neovim on OS X where C-h
  " is sent as backspace for some reason.
  nnoremap <BS> <C-W>h
endif

" Shortcut to yanking to the system clipboard
map <leader>y "*y
map <leader>p "*p

" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<cr>

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
" autocmd BufWritePre * :%s/\s\+$//e

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999

" spacing based on filetype
autocmd FileType html setlocal shiftwidth=4 tabstop=4
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"----------------------------------------------------------------------
" Neovim
"----------------------------------------------------------------------
" In neovim, we configure more things via Lua
if has("nvim")
    lua require("vim-misc")
    lua require("callbacks")

    " Fold via treesitter
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
endif

"----------------------------------------------------------------------
" Telescope
"----------------------------------------------------------------------
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
