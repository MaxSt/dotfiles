## How To install my Vim Config

###1. Rename this Directory
`mv dotvim .vim` renames this directory to .vim (put this in your home directory)

###2. Create symbolic link
`ln -s ~/.vim/vimrc ~/.vimrc` after this ~/.vimrc points to the ~/.vim/vimrc file

###3. Setup [Vundle]:
In ~/.vim do:
```
$ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

###4. Configure bundles:

Bundlefile is `bundles.vim`

##Info
Commant-T requires VIM with ruby support
When you have VIM with ruby support go to `~/.vim/bundle/commant-t` and type `rake make` to install Command-T

[Vundle]:http://github.com/gmarik/vundle
