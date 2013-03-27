    " Basics {
      set nocompatible 		" must be first line
      filetype off     " required!
      set background=dark     " Assume a dark background
      "The default leader is '\', but many people prefer ',' as it's in a standard
      "location
      let mapleader = ','

      " Automatic reloading of .vimrc
      "autocmd! bufwritepost .vimrc source %
    " }
  " }

    " Plugins {
      " Vundler {
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        source ~/.vim/bundles.vim
    " }


    " NERDTree {
        "autocmd VimEnter * NERDTree           "Open NERDTree on Startup
        let NERDTreeQuitOnOpen = 1 			    " Closes NERDTree After Opening a file
        noremap <silent> \ :NERDTreeToggle<CR>	" open/close Nerdtree on ctrl + m
    " }


    " Ultisnips support functions{
        " add support_fucntions to snipptes
        " let g:UltiSnipsSnippetsDir = '~/.vim/mySnippets'
        let g:UltiSnipsExpandTrigger = "<c-space>"
    " }


    " MiniBufExplorer{
        " Set Hotkeys for Buffer Switching
          nmap <silent> ]b :MiniBufExplorer<CR>l<CR>
          nmap <silent> [b :MiniBufExplorer<CR>h<CR>
          " Close Buffer and dont change window layout
          nmap <silent> <leader>w :MiniBufExplorer<CR>d<CR><ESC>
          let g:miniBufExplCheckDupeBufs = 0 "faster for many buffers
          let g:miniBufExplMapWindowNavVim = 1 "ctrl-<hjkl> for window navigation
    " }


    " Supertab{
      let g:SuperTabDefaultCompletionType = "context"
      " Damit Tab nach unten geht und nicht nach oben
      let g:SuperTabMappingBackward = '<tab>'
      " Damit S-Tab nach oben geht und nicht nach unten 
      let g:SuperTabMappingForward = '<s-tab>'"
    " }


    " ctrlp{
        let g:ctrlp_map = '<leader>t'
        "noremap <leader>g :CtrlPTag<cr> for tags but diabled atm
        let g:ctrlp_working_path_mode = 0 " Dont manage working directory
        let g:ctrlp_open_new_file = 'r' " ctrlp opens new file in current window
        let g:ctrlp_open_multiple_files = 'rr'
        "let g:ctrlp_extensions = ['tag'] for tags but disabled atm
    " }


    " Powerline{
        let g:Powerline_symbols = 'compatible'
    " }

    " Intent-Guides (binding: ,ig) {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }

    " delimitMate{
        let delimitMate_matchpairs = '(:),[:],{:},<:>'
    " }

    " Gundo{
        nnoremap  <leader>u :GundoToggle<CR>
    " }

    " syntastic{
        let g:syntastic_auto_loc_list=1
    " }

    " TableMode{
        noremap ,T :TableModeToggle<CR>
    " }

    " YouCompleteMe{
    let g:ycm_complete_in_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

    " }
"}


" General {
	syntax on 					" syntax highlighting

  if $COLORTERM == 'gnome-terminal'
    set t_Co=256
  endif

  if has('gui_running')
    set guioptions-=m
    if has("mac")
      set guifont=DejaVu\ Sans\ Mono:h15          " set Font by Editing with a gui
    elseif has('unix')
      set guifont=DejaVuSansMono\ 14
    endif
  else
    let g:solarized_termcolors=256  " set colors to termcolors for terminal
  endif
	set mouse=a					" automatically enable mouse usage
  set report=0
  set encoding=utf-8
  set completeopt=longest,menu,preview
	scriptencoding utf-8

  set clipboard=unnamedplus       " for standard os clipboard
  set noeb vb t_vb=               " disable peep
  set autoread                    " automatically load file when its changed
	" set autowrite                 " automatically write a file when leaving a modified buffer
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	"set virtualedit=onemore 	   	" allow for cursor beyond last character
  set history=1000  				" Store a ton of history (default is 20)
  set spelllang=en,de_at       " Set Language to German and English (for Spellchecking)
	set nospell 		 	        	" spell checking off
  set nobackup       " no backup files
  set nowritebackup  " only in case you don't want a backup file while editing
  set noswapfile     " no swap files
  set hidden         " lets you open multiple buffers without saving
  set modeline
  set sessionoptions=buffers,folds,tabpages,winsize
  "dont load binary files:
  set wildignore+=*.xlsx,*.ico,*.png,*.jpg,*.gif,*.jpeg,*.xcf,*.xls,*.orig,*.swp,*.bak,*.pyc,*.class,*.obj,*.o
  set foldmethod=indent
  set nofoldenable
  if has('mac')
    set macmeta
  endif
" }

" Vim UI {
  set showcmd	                    " Show current command
	color solarized     	       		" load a colorscheme
  source ~/.vim/max-colors.vim    " load customized colors
  set wildmenu                    " show menu in commandline (tabs)
	set tabpagemax=15 				      " only show 15 tabs
	" set showmode                  " display the current mode
  set ttyfast                     " Improves redrawing
  set number                      " Views Line Numbers
  set guioptions-=T
  set guioptions-=r

	set cursorline  				" highlight current line (performance issues)
  set laststatus=2        " Always show the statusline

" }


" Formatting {
    set backspace=2		              " more powerful backspacing
    set wrap                       	" wrap long lines
    set autoindent                 	" indent at the same level of the previous line
    set shiftwidth=2               	" use indents of 4 spaces
    set expandtab 	  	     		    " tabs are spaces, not tabs
    set tabstop=2 					        " an indentation every four columns
    set softtabstop=2 				      " let backspace delete indent
    " Better copy & paste
    " When you want to paste large blocks of code into vim, press F2 before you
    " paste. At the bottom you should see ``-- INSERT (paste) --``.

    set pastetoggle=<F2>
    set clipboard=unnamed
    set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
    set showmatch                   " set show matching parenthesis
    set ignorecase                  " ignore case (must be set for smartcase)
    set smartcase                   " ignore case if search pattern is all lowercase,
                                    "    case-sensitive otherwise
    set smarttab                    " insert tabs on the start of a line according to
                                    "    shiftwidth, not tabstop
    set hlsearch                    " highlight search terms
    set incsearch                   " show search matches as you type
    set ruler                       " show the cursor position
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
  set listchars=eol:¬,tab:▸\ ,trail:.,extends:>,precedes:<,nbsp:⁝

  " Easier moving in tabs and windows
  map <C-Tab> <C-W><C-W>

  " Maps Alt-[h,j,k,l] to resizing a window split
  noremap <silent> <A-h> <C-w><<esc>
  noremap <silent> <A-j> <C-W>-<esc>
  noremap <silent> <A-k> <C-W>+<esc>
  noremap <silent> <A-l> <C-w>><esc>

  "space to : for easier commands
  noremap <space> :

  "§ for Window switching
  noremap § <C-W>

  " <control-c> system copy
  vnoremap <C-C> "+y
  noremap <C-C> "+yy

  "match closest and lets you type while autocomplete

  "activate/deaktivate Hightlight search
  function! ToggleHighlight()
   let Myhl= &hlsearch
   if &hlsearch
      let Myhl="nohlsearch"
   else
      let Myhl="hlsearch"
   endif
   exe "setlocal " . Myhl
  :endfunction

  "Alias the ToggleHighlight function
  :command! ToggleHighlight call ToggleHighlight()

  "Easy vimrc editing
  :command! Vimrc :e "~/.vimrc"<CR>

  "Map ToggleHighlight function to ,d
  nnoremap <silent> <leader>d :ToggleHighlight<CR>

  "diable visualbell
  autocmd GUIEnter * set vb t_vb= " for your GUI
  autocmd VimEnter * set vb t_vb=

  "activate/deaktivate Spell checking
  function! ToggleSpell()
   let Myspl=&spell
   if &spell
      let Myspl="nospell"
   else
      let Myspl="spell"
   endif
   exe "setlocal " . Myspl
  :endfunction

  "Alias the ToggleSpell function
  :command! ToggleSpell call ToggleSpell()

  "Map Spell function to ,s
  nnoremap <silent> <leader>s :ToggleSpell<CR>

  "set Path to pdflatex for making pdfs out ouf vim
  :command! PDFlatex !/usr/texbin/pdflatex %
"}
