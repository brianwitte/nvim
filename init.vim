"important stuffs================================
syntax on
source ~/.config/nvim/plugins.vim

"CUSTOM SCRIPTS==================================
source ~/.config/nvim/custom_scripts.vim

"COLORS AND FONTS================================

set guifont=Source\ Code\ Pro
let base16colorspace=256
set t_Co=256
" set background=dark
if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme dichromatic
" setting transparancy same to terminal
" hi normal guibg=000000

"VISUALS AND UI==================================
set wildmenu
set nu
set cursorline
set culopt=number
set colorcolumn=96
set clipboard+=unnamedplus
set laststatus=2
set signcolumn=no
autocmd! ColorScheme * hi VertSplit cterm=NONE gui=NONE
set so=7
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw 
set magic
set showmatch 
set mat=2

"BEHAVIOURS======================================
set history=500
set autoread
au FocusGained,BufEnter * checktime
set ignorecase
set smartcase
set hlsearch
set incsearch 
" :W sudo saves the file 
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set ai "Auto indent
set si "Smart indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set wrap "Wrap lines


"FILETYPE SPECIFICS==============================
" Enable filetype plugins
filetype plugin on
filetype indent on
filetype plugin indent on

au FileType markdown set tw=80
au FileType latex set tw=80

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -o %:r -W<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"COMPLETION======================================
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

"MAPPINGS========================================
let mapleader="\\"
""" bind mapleader only in normal  mode
nnoremap \\ <NOP>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-W> :Bclose <CR>

" tag goto
nnoremap <leader>g <C-]>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
 map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Spell Checking
map <leader>ss :setlocal spell!<cr>

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
