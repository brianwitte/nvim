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

" Utils
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color' 
Plug 'mileszs/ack.vim'


" Previews
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Latex/ markdowns
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'metakirby5/codi.vim'

" coc nvim
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


" vim-markdown:
let g:tex_conceal = ""
" the default item indent is stupid
let g:tex_indent_items=0

let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

" Vim-live LAtex
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1

" vim-markdown-preview
let g:mkdp_open_to_the_world = 1
let g:mkdp_browser = 'vimb'
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = 6789
let g:mkdp_browser = 'vimb'
let g:mkdp_refresh_slow = 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }


" NERDCOMMENTER:
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCustomDelimiters = { 'cpp': { 'left': '/*','right': '*/' } }
