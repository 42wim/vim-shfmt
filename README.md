# vim-shfmt
Vim plugin for shfmt (based on https://github.com/fatih/vim-hclfmt)

The plugin by default will format `*.sh` files on save.
Under the hood it uses [shfmt](https://github.com/mvdan/sh) to process the
files.

## Usage

Save the file or call `:ShFmt`.

By default vim-shfmt automatically formats *.sh files. You can permanently disable this configuration in your `~/.vimrc` as follows:

    let g:sh_fmt_autosave = 0


## Install

Vim-shfmt follows the standard runtime path structure. For Pathogen just clone
the repo. For other plugin managers add the appropriate lines and execute the
plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/42wim/vim-shfmt.git ~/.vim/bundle/vim-shfmt`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug '42wim/vim-shfmt'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle '42wim/vim-shfmt'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin '42wim/vim-shfmt'`

If [shfmt](https://github.com/mvdan/sh) is not already installed:

    go get -u mvdan.cc/sh/cmd/shfmt
