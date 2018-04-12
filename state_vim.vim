if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/walt/.config/nvim,/etc/xdg/xdg-xmonad/nvim,/etc/xdg/nvim,/home/walt/.local/share/nvim/site,/usr/share/xmonad/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/var/lib/snapd/desktop/nvim/site/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/xmonad/nvim/site/after,/home/walt/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-xmonad/nvim/after,/home/walt/.config/nvim/after,/home/walt/.config/nvim/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/walt/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/walt/.config/nvim'
let g:dein#_runtime_path = '/home/walt/.config/nvim/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/walt/.config/nvim/.cache/init.vim'
let &runtimepath = '/home/walt/.config/nvim,/etc/xdg/xdg-xmonad/nvim,/etc/xdg/nvim,/home/walt/.local/share/nvim/site,/usr/share/xmonad/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/walt/.config/nvim/repos/github.com/Shougo/dein.vim,/home/walt/.config/nvim/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/walt/.config/nvim/.cache/init.vim/.dein/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/xmonad/nvim/site/after,/home/walt/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-xmonad/nvim/after,/home/walt/.config/nvim/after'
filetype off
