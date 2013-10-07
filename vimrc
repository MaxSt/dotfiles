" Basics {
    set nocompatible               " must be first line
    syntax on
" }

 " Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization  across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

" General {
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif

    if has('gui_running')
      "Maxiize Window
      set lines=50 columns=170
      set guioptions-=m

      if has("gui_gtk2")
          set guifont=EnvyCodeR\ 12,Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
      elseif has("gui_mac")
          set guifont=EnvyCodeR:h12,Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
      elseif has("gui_win32")
          set guifont=EnvyCodeR:h12,Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
      endif
    endif
    set mouse=a                                                   " automatically enable mouse usage
    set report=0
    set encoding=utf-8
    set completeopt=longest,menu,preview
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
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
    set wildignore+=*.xlsx,*.ico,*.png,*.jpg,*.gif,*.jpeg,*.xcf,*.xls,*.orig,*.swp,*.bak,*.pyc,*.class,*.obj,*.o,*.aux,*.odg,*.pdf
    set foldmethod=indent
    set nofoldenable
    let mapleader = ','            " The default leader is '\', but many people prefer ',' as it's in a standard location
    set nostartofline
    if has('mac')
      set macmeta
    endif
" }

" Vim UI {
    set showcmd                                                   " Show current command
    set wildmenu                                                  " show menu in commandline (tabs)
    set tabpagemax=15                                             " only show 15 tabs
    set ttyfast                                                   " Improves redrawing
    set number                                                    " Views Line Numbers
    set relativenumber                                            " Views Line Numbers
    set linespace=0                                               " No extra spaces between rows
    set winminheight=0                                            " Windows can be 0 line high
    set scrolljump=5                                              " Lines to scroll when cursor leaves screen
    set scrolloff=3                                               " Minimum lines to keep above and below cursor
    autocmd FocusLost * set number "set absolute numbers when focus lost
    autocmd FocusGained * set relativenumber "set relative numbers when focus gained
    autocmd InsertEnter * set number "set absolute numbers when in insert mode
    autocmd InsertLeave * set relativenumber "set relative numbers when in normal mode


    set guioptions-=T
    set guioptions-=r

    set cursorline                                                " highlight current line (performance issues)
    set cursorcolumn                                              " highlight current column (performance issues)

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
    set smarttab                                                " insert tabs on the start of a line according to
    " shiftwidth, not tabstop
    set hlsearch                                                " highlight search terms
    set incsearch                                               " show search matches as you type
    set ruler                                                   " show the cursor position
    set cmdheight=1
    set showcmd
    set so=14                                                   " Keep cursor away from edges of screen.
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
    " Buffer swtiching with [Bufferindex]!
    nnoremap ! :<C-u>b<C-r>=v:count<CR><CR>

    " Better Mark jumps
    noremap <leader>m :marks<CR>
    noremap ` '
    noremap ' `

    " Wrapped lines goes down/up to next row, rather than next line in file.
    "noremap j gj
    "noremap k gk

    " Better Command Line editing
    cnoremap <C-j> <t_kd>
    cnoremap <C-k> <t_ku>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>

    "Map Q to repeat last recorded Macro
    noremap Q @@

    " Select last inserted text with C-i
    nmap <C-I> `[v`]


    " select Visual again after shifting
    vnoremap > >gv
    vnoremap < <gv

    " what to show when I hit :set list
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
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

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>f to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    "Make Y behave Like D or C
    nmap Y y$

    "J and K to Jump to beginning of Line
    noremap J +
    noremap K -
    "to Join lines
    noremap <leader>j J
    "to show help under cursor
    noremap <leader>k K

    "write file with <leader>w
    noremap <leader>w :update<CR>
    noremap ; :buffer<Space>

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
" }

" Shell command {
  function! s:RunShellCommand(cmdline)
      botright new

      setlocal buftype=nofile
      setlocal bufhidden=delete
      setlocal nobuflisted
      setlocal noswapfile
      setlocal nowrap
      setlocal filetype=shell
      setlocal syntax=shell

      call setline(1, a:cmdline)
      call setline(2, substitute(a:cmdline, '.', '=', 'g'))
      execute 'silent $read !' . escape(a:cmdline, '%#')
      setlocal nomodifiable
      1
  endfunction

  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
  " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
" }

" Plugins {
    " Use bundles config
    if filereadable(expand("~/.vim/bundles.vim"))
        source ~/.vim/bundles.vim
    endif

    filetype plugin indent on         " Automatic detect file types
" }
