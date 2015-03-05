Dotfiles
========

This repository includes custom dotfiles.  They should be cloned to
the home directory so that the path is `~/dotfiles/`.  The included setup
script creates symlinks from your home directory to the files which are located
in `~/dotfiles/`.

The setup script is smart enough to back up your existing dotfiles into a
`~/dotfiles_old/` directory if you already have any dotfiles of the same name as
the dotfile symlinks being created in your home directory.

So, to recap, the install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory

Installation
------------

``` bash
git clone git://github.com/dlebauer/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```

LICENSE
-------

Modified from [Michael J Smalley's GitHub repository](https://github.com/michaeljsmalley/dotfiles), retaining the original GPL-3 license in file LICENSE. 

