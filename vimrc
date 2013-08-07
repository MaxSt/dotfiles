" Basics {
    set nocompatible               " must be first line
    filetype off                   " required!
    set background=dark            " Assume a dark background
    let mapleader = ','            " The default leader is '\', but many people prefer ',' as it's in a standard location

    " Automatic reloading of .vimrc (Colors are not reloading)
    autocmd! bufwritepost .vimrc source %
" }

 " Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization  across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

" Plugins {
    source ~/.vim/bundles.vim
" }

" General {
    syntax on                         " syntax highlighting
    filetype plugin indent on         " Automatic detect file types

    if $COLORTERM == 'gnome-terminal'
      set t_Co=256
    endif

    if has('gui_running')
      set guioptions-=m
      if has(" mac")
        set guifont=DejaVu\ Sans\ Mono:h15                        " set Font by Editing with a gui
      elseif has('unix')
        set guifont=Anonymous\ Pro\ 14
      endif
    endif
    set mouse=a                                                   " automatically enable mouse usage
    set report=0
    set encoding=utf-8
    set completeopt=longest,menu,preview
    scriptencoding utf-8

    set clipboard=unnamedplus                                     " for standard os clipboard
    set noeb vb t_vb=                                             " disable peep
    set autoread                                                  " automatically load file when its changed
    " set autowrite                 " automatically write a file when leaving a modified buffer
    set viewoptions=folds,options,cursor,unix,slash               " better unix / windows compatibility
    " set virtualedit=onemore        " allow for cursor beyond last character
    set history=1000                                              " Store a ton of history (default is 20)
    set spelllang=en,de_at                                        " Set Language to German and English (for Spellchecking)
    set nospell                                                   " spell checking off
    set nobackup                                                  " no backup files
    set nowritebackup                                             " only in case you don't want a backup file while editing
    set backupdir=~/.vim/tmp
    set noswapfile                                                " no swap files
    set noautowrite
    set hidden                                                    " lets you open multiple buffers without saving
    set nomodeline
    set sessionoptions=buffers,folds,tabpages,winsize
    " dont load binary files:
    set wildignore+=*.xlsx,*.ico,*.png,*.jpg,*.gif,*.jpeg,*.xcf,*.xls,*.orig,*.swp,*.bak,*.pyc,*.class,*.obj,*.o
    set foldmethod=indent
    set nofoldenable
    set nostartofline
    if has('mac')
      set macmeta
    endif
" }

" Vim UI {
    set showcmd                                                   " Show current command
    if has('gui_running')
      color molokai                                               " load a colorscheme
    else
      color molokai                                               " load a colorscheme
    end
    source ~/.vim/max-colors.vim                                  " load customized colors
    set wildmenu                                                  " show menu in commandline (tabs)
    set tabpagemax=15                                             " only show 15 tabs
    set ttyfast                                                   " Improves redrawing
    set number                                                    " Views Line Numbers
    set relativenumber                                            " Views Line Numbers
    autocmd FocusLost * set number "set absolute numbers when focus lost
    autocmd FocusGained * set relativenumber "set relative numbers when focus gained
    autocmd InsertEnter * set number "set absolute numbers when in insert mode
    autocmd InsertLeave * set relativenumber "set relative numbers when in normal mode


    set guioptions-=T
    set guioptions-=r

    set cursorline                                                " highlight current line (performance issues)
    set laststatus=2                                              " Always show the statusline

" }


" Formatting {
    set backspace=2                                             " more powerful backspacing
    set wrap                                                    " wrap long lines
    set autoindent                                              " indent at the same level of the previous line
    set shiftwidth=2                                            " use indents of 4 spaces
    set expandtab                                               " tabs are spaces, not tabs
    set tabstop=2                                               " an indentation every four columns
    set softtabstop=2                                           " let backspace delete indent

    " Better copy & paste
    " When you want to paste large blocks of code into vim, press F2 before you
    " paste. At the bottom you should see ``-- INSERT (paste) --``.
    set pastetoggle=<F2>

    set shiftround                                              " use multiple of shiftwidth when indenting with '<' and '>'
    set showmatch                                               " set show matching parenthesis
    set ignorecase                                              " ignore case (must be set for smartcase)
    set smartcase                                               " ignore case if search pattern is all lowercase,
    set gdefault                                                " %s /g is on --> all matches in a line are substituted instead of one
    set smarttab                                                " insert tabs on the start of a line according to
    " shiftwidth, not tabstop
    set hlsearch                                                " highlight search terms
    set incsearch                                               " show search matches as you type
    set ruler                                                   " show the cursor position
    set cmdheight=1
    set showcmd
" }
    "set undofile (undo after re- opening vim)
    if exists("+undofile")
      " undofile - This allows you to use undos after exiting and restarting
      " :help undo-persistence
      " This is only present in 7.3+
      set undodir=~/.vim/tmp/
      set undofile
    endif

" Key (re)Mappings {

    " Better Command Line editing
    cnoremap <C-j> <t_kd>
    cnoremap <C-k> <t_ku>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>

    "Map Q to repeat last recorded Macro
    noremap Q @@

    " Select last inserted text with C-i
    nmap <C-I> `[v`]

    " easier shifting
    noremap > >>
    noremap < <<

    " select Visual again after shifting
    vnoremap > >gv
    vnoremap < <gv

    " what to show when I hit :set list
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    set showbreak=↳
    " Easier moving in tabs and windows
    map <C-Tab> <C-W><C-W>

    " Maps Alt-[h,j,k,l] to resizing a window split
    noremap <silent> <A-h> <C-w><<esc>
    noremap <silent> <A-k> <C-W>-<esc>
    noremap <silent> <A-j> <C-W>+<esc>
    noremap <silent> <A-l> <C-w>><esc>

    " space to : for easier commands
    noremap <space> :

    " § for Window switching
    noremap § <C-W>

    "control + hjkl to switch windows
    noremap <C-J>     <C-W>j
    noremap <C-K>     <C-W>k
    noremap <C-H>     <C-W>h
    noremap <C-L>     <C-W>l

    "Make Y behave Like D or C
    nmap Y y$

    "write file with <leader>w
    noremap <leader>w :w<CR>

    " match closest and lets you type while autocomplete

    " activate/deaktivate Hightlight search
    function! ToggleHighlight()
    let Myhl= &hlsearch
    if &hlsearch
        let Myhl=" nohlsearch"
    else
        let Myhl=" hlsearch"
    endif
    exe" setlocal " . Myhl
    :endfunction

    "Select indent level
    function SelectIndent()
      let cur_line = line(".")
      let cur_ind = indent(cur_line)
      let line = cur_line
      while indent(line - 1) >= cur_ind
        let line = line - 1
      endw
      exe "normal " . line . "G"
      exe "normal V"
      let line = cur_line
      while indent(line + 1) >= cur_ind
        let line = line + 1
      endw
      exe "normal " . line . "G"
    endfunction
    nnoremap vii :call SelectIndent()<CR>
    nmap cii viic
    nmap dii viid

    " Alias the ToggleHighlight function
    command! ToggleHighlight call ToggleHighlight()

    " Easy vimrc editing with :EditVim
    command! EditVim :edit ~/.vimrc

    " Map ToggleHighlight function to ,d
    nnoremap <silent> <leader>d :ToggleHighlight<CR>

    " diable visualbell
    autocmd GUIEnter * set vb t_vb=                               " for your GUI
    autocmd VimEnter * set vb t_vb=

    " activate/deaktivate Spell checking
    function! ToggleSpell()
    let Myspl=&spell
    if &spell
        let Myspl=" nospell"
    else
        let Myspl=" spell"
    endif
    exe" setlocal " . Myspl
    :endfunction

    " Alias the ToggleSpell function
    :command! ToggleSpell call ToggleSpell()

    " Map Spell function to ,s
    nnoremap <silent> <leader>s :ToggleSpell<CR>

    " set Path to pdflatex for making pdfs out ouf vim
    :command! PDFlatex !/usr/texbin/pdflatex %
" }
