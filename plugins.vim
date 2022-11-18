call plug#begin('~/.vim/plugged')

" Apparance
Plug 'rafi/awesome-vim-colorschemes'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'vim-scripts/ScrollColors'
Plug 'kyazdani42/nvim-web-devicons'  

" Layouts & Lines & Bars
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" Misc
Plug 'tweekmonster/startuptime.vim'

" Editor
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'rbgrouleff/bclose.vim'


" Programming
Plug 'majutsushi/tagbar' 
Plug 'rhysd/vim-clang-format'
Plug 'alx741/vim-stylishask'
Plug 'preservim/nerdcommenter' 
Plug 'Chiel92/vim-autoformat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'ziglang/zig.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'vim-ruby/vim-ruby'

" Utils
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color' 
Plug 'mileszs/ack.vim'
Plug 'folke/which-key.nvim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'mhinz/vim-signify'
Plug 'kdheepak/lazygit.nvim'

Plug 'weizheheng/ror.nvim'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-projectionist'

" co nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" gutentags
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

" Ack
let g:ackprg = 'ag --vimgrep'

let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode=1

"" lightline: 
source ~/.config/nvim/lightline_conf.vim

"" Bufferline
let g:bufferline_echo = 0
let g:python3_host_prog='/usr/bin/python3'

nmap <F7> :TagbarToggle<CR>
nmap <F8> :NERDTreeToggle<CR>


" CtrlP:
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>t  :CtrlPTag<cr>


nmap <F3> :Autoformat<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCustomDelimiters = { 'cpp': { 'left': '/*','right': '*/' } }

