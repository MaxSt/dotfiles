" Basics {
    set nocompatible               " must be first line
    filetype off                   " required!
    set background=dark            " Assume a dark background
    let mapleader = ','            " The default leader is '\', but many people prefer ',' as it's in a standard location

    " Automatic reloading of .vimrc (Colors are not reloading)
    autocmd! bufwritepost .vimrc source %
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
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 14
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

    set clipboard=unnamed
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


" Key (re)Mappings {
    " Better j k movement when line wrap is enabled (each line on screen)
    nmap j gj
    nmap k gk
    " For old use of j k (each line in file)
    noremap ,j j
    noremap ,k k

    " Select last inserted text with C-i
    nmap <C-I> `[v`]

    " easier shifting
    noremap > >>
    noremap < <<

    " select Visual again after shifting
    vnoremap > >gv
    vnoremap < <gv

    " what to show when I hit :set list
    set listchars=tab:»-,trail:·,extends:>,precedes:<
    set showbreak=↳
    " Easier moving in tabs and windows
    map <C-Tab> <C-W><C-W>

    " Maps Alt-[h,j,k,l] to resizing a window split
    noremap <silent> <A-h> <C-w><<esc>
    noremap <silent> <A-j> <C-W>-<esc>
    noremap <silent> <A-k> <C-W>+<esc>
    noremap <silent> <A-l> <C-w>><esc>

    " space to : for easier commands
    noremap <space> :

    " § for Window switching
    noremap § <C-W>

    " <control-c> system copy
    vnoremap <C-C>                                                " +y
    noremap <C-C>                                                 " +yy

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
