# nvim

neovim setup for relaysix

## Requirements

* Vim 7.4 or above or NeoVim.
* "xcopy" command in $PATH (Windows)
* "git" command in $PATH (if you want to install github or vim.org plugins)

## Quick start

Note: You must define the installation directory before to use dein.  It
depends on your usage.
For example, "\~/.vim/bundles" or "\~/.cache/dein" or "\~/.local/share/dein".
dein.vim has not define the default installation directory.
You must not set the installation directory under "\~/.vim/plugin" or
"\~/.config/nvim/plugin".

#### If you are using Unix/Linux or Mac OS X.

Note: {directory} is just placeholder.

1. Run below script.

     ```
     $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
     $ sh ./installer.sh {specify the installation directory}
     ```

2. Edit your .vimrc like this.

    ```vim
    if &compatible
      set nocompatible
    endif
    set runtimepath+={path to dein.vim directory}

    if dein#load_state({path to plugin base path directory})
      call dein#begin({path to plugin base path directory})

      call dein#add({path to dein.vim directory})
      call dein#add('Shougo/deoplete.nvim')
      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif
      ...

      call dein#end()
      call dein#save_state()
    endif

    filetype plugin indent on
    syntax enable
    ```

3. Open vim and install dein

    ```vim
    :call dein#install()
    ```
