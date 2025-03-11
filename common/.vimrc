"Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

" Tabs settings
set shiftwidth=4
set tabstop=4
set expandtab

" Other
set nocompatible
set backspace=indent,eol,start
filetype on
filetype plugin on
filetype indent on
"" set number
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set wildmenu
set wildmode=list:longest
set hlsearch
set notimeout
set noswapfile
syntax off

" Theme
" let g:gruvbox_contrast_light='medium'
" set background=light
"colorscheme acme

" Keybindings
let g:mapleader = " "

"" Files
map <leader>h :noh<CR>
map <leader>ff :Files<CR>

"" Git
map <leader>gg :GFiles<CR>
map <leader>gs :GFiles?<CR>
map <leader>gb :BCommits<CR>
map <leader>gd :Git diff<CR>
map <leader>gl :Git log<CR>


"" Buffers
map <leader>bb :Buffers<CR>
map <leader>bc :Changes<CR>
map <leader>bd :bd<CR>

"" Search
map <leader>/ :Ag<CR>

"" Windows
map <leader>wl :Windows<CR>
map <leader>wd :q<CR>
map <leader>wc :cope<CR>

"" Other
map <leader>tt :Colors<CR>
map <leader>c :Commands<CR>

"" Help
nmap <leader>d <plug>(YCMHover)

" Plugins settings
let g:ycm_auto_hover = 0
