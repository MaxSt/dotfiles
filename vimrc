" vim: foldmarker={{{,}}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
syntax on

set virtualedit=block
set nojoinspaces
set expandtab smarttab

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

set foldmethod=indent
set nofoldenable
set synmaxcol=1000
set mouse=a
set report=0
set encoding=utf-8
set completeopt=longest,menu,preview
scriptencoding utf-8

"disable peep
set noeb vb t_vb=

set autoread                                                  " automatically load file when its changed
set viewoptions=folds,options,cursor,unix,slash
set history=1000

set spelllang=en,de_at
set spellfile=~/.vim/spell/custom.utf-8.add
set nospell

set nobackup
set nowritebackup
set backupdir=~/.vim/tmp

"open horizontal split below
set splitbelow
"open vertical split right
set splitright
set noequalalways

set noswapfile
set noautowrite
set lazyredraw

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set fillchars=vert:│ "Set vertical border of splits

" lets you open multiple buffers without saving
set hidden

set conceallevel=0

set modelines=2
set sessionoptions=buffers,folds,tabpages,winsize
" dont load binary files:
set wildignore+=*.xlsx,*.ico,*.png,*.jpg,*.gif,*.jpeg,*.xcf,*.xls,*.orig,*.swp,*.bak,*.pyc,*.class,*.obj,*.o,*.aux,*.odg,*.pdf
let mapleader = ','
let maplocalleader = ','

set nostartofline

if has('mac')
  set macmeta
endif

set showcmd                                                   " Show current command
set wildmenu                                                  " show menu in commandline (tabs)
set tabpagemax=15                                             " only show 15 tabs
set ttyfast                                                   " Improves redrawing
set number                                                    " Views Line Numbers
set numberwidth=1
set relativenumber                                            " Views Line Numbers
set linespace=0                                               " No extra spaces between rows
set winminheight=0                                            " Windows can be 0 line high
set scrolljump=5                                              " Lines to scroll when cursor leaves screen
set scrolloff=0                                               " Minimum lines to keep above and below cursor

set nocursorline                                                " highlight current line
set nocursorcolumn                                            " highlight current column

set laststatus=2                                              " Always show the statusline

set backspace=2                                             " more powerful backspacing
set wrap                                                    " wrap long lines
set autoindent                                              " indent at the same level of the previous line
set shiftwidth=2                                            " use indents of 4 spaces
set expandtab                                               " tabs are spaces, not tabs
set tabstop=2                                               " an indentation every four columns
set softtabstop=2                                           " let backspace delete indent
set textwidth=80
set colorcolumn=+0
set shiftround                                              " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                                               " set show matching parenthesis
set ignorecase                                              " ignore case (must be set for smartcase)
set smartcase                                               " ignore case if search pattern is all lowercase,
set hlsearch                                                " highlight search terms
set incsearch                                               " show search matches as you type
set ruler                                                   " show the cursor position
set cmdheight=1
set diffopt+=vertical                                       " diffs vertical

"set undofile (undo after re- opening vim)
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " :help undo-persistence
  " This is only present in 7.3+
  set undodir=~/.vim/tmp/
  set undofile
endif

"}}}

" ============================================================================
" NEOVIM {{{
" ============================================================================
if has('nvim')
  " set poython host (default would be python3)
  "let g:python_host_prog='/usr/bin/python2'
  highlight TermCursor ctermbg=1 guibg=#ff6767
  "set termguicolors

  " Terminal settings
  tnoremap <C-\> <C-\><C-n>

  " Window navigation function
  " Make ctrl-h/j/k/l move between windows and auto-insert in terminals

  ":au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " " Workaround since <C-h> isn't working in neovim right now
  tnoremap <c-h> <C-\><C-n><C-w>h
  tnoremap <c-j> <C-\><C-n><C-w>j
  tnoremap <c-k> <C-\><C-n><C-w>k
  tnoremap <c-l> <C-\><C-n><C-w>l

  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " Hack to get C-h working in neovim
  nmap <BS> <C-W>h

  set ttimeout
  set ttimeoutlen=0
endif
" }}}

" ============================================================================
" GUI {{{
" ============================================================================
if has('patch-7.4.1778')
  set guicolors
endif
if has('gui_running')
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=e

  if has("gui_gtk2")
      set guifont=Hack\ 11
  elseif has("gui_mac")
      set guifont=Hack:11
  elseif has("gui_win32") || has('win64')
      set guifont=Hack:11
  endif
endif

" }}}

" ============================================================================
" MAPPINGS {{{
" ============================================================================
" store relative line number jumps in jumplist
" NOTE: m' stores current position in jumplist
" NOTE: thanks to osse and bairui in #vim IRC!
nnoremap <silent> k :<C-U>execute 'normal!' (v:count>1 ? "m'".v:count.'k' : 'k')<Enter>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count>1 ? "m'".v:count.'j' : 'j')<Enter>

" switch 0 and ^
noremap 0 ^
noremap ^ 0

" Buffer swtiching with [Bufferindex]!
nnoremap ! :<C-u>b<C-r>=v:count<CR><CR> " nnoremap #! :b #<CR>

" Map <space> to : for faster command mode
"noremap <space> :

" Better Mark jumps
noremap <leader>m :marks<CR>

"go to marks 'exact
noremap ` '
noremap ' `

"Map Q to repeat last recorded Macro
noremap Q @@

" Select last inserted text
nmap gp `[v`]

" select Visual again after shifting
vnoremap > >gv
vnoremap < <gv

" Maps Alt-[h,j,k,l] to resizing a window split
noremap <silent> <A-h> <C-w><<esc>
noremap <silent> <A-k> <C-W>-<esc>
noremap <silent> <A-j> <C-W>+<esc>
noremap <silent> <A-l> <C-w>><esc>

" Map <Leader>f to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"<leader>y or <leader>p for system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

"Make Y behave Like D or C
noremap Y y$

"J and K to Jump to beginning of Line
noremap J +
noremap K -
"to Join lines
noremap <leader>j J
"to show help under cursor
noremap <leader>k K

"write file with gs
noremap gs :w<CR>

" go to end of search highlight
noremap <silent> <leader>e /<c-r>//e<cr>:let @/='<c-r>/'<cr>

" Easy vimrc editing with :EditVim
command! VimEdit :edit ~/.vimrc
noremap g. :VimEdit<CR>

nnoremap <silent> <leader>l :set spell!<CR>

"Opens the help page on the current window if cursor is in a help page or opens another tab if it's not
command! -nargs=1 -complete=help Help if &ft=~"help" | help <args> | else | tab help <args> | endif

"Display the numbered registers, press a key and paste it to the buffer
function! Reg()
  reg
  echo "Register: "
  let char = getchar()
  execute "normal! \"".nr2char(char)."p"
  redraw
  normal! k
endfunction
command! -nargs=0 Reg call Reg() | normal <cr>

" }}}

" ============================================================================
" PLUGINS {{{
" ============================================================================
if filereadable(expand("~/.vim/bundles.vim"))
    source ~/.vim/bundles.vim
endif

" Automatic detect file types
filetype plugin indent on
" }}}

