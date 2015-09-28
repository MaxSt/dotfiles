" Easy bundles editing with :EditBundles
command! BundlesEdit :edit ~/.vim/bundles.vim
noremap gb :BundlesEdit<CR>

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

  " Colorscheme
  Plug 'MaxSt/FlatColor'
  let g:flatcolor_termcolors=16
  set background=dark

  " ctrlp (open file with fuzzy search)
  Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_map = '<leader>t'
  let g:ctrlp_open_new_file = 'r' " ctrlp opens new file in current window
  let g:ctrlp_cache_dir='~/.vim/tmp/'
  " let g:ctrlp_reuse_window='startify'
  let g:ctrlp_open_multiple_files = 'rr'
  " let g:ctrlp_clear_cache_on_exit=1
  let g:ctrlp_max_files = 10000
  let g:ctrlp_follow_symlinks=1
  nmap <leader>b :CtrlPBuffer<CR>
  if executable('ag')
    let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .']
      \ },
      \ 'fallback': 'ag %s -l --nocolor -g ""'
    \ }
  else
    let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .']
      \ },
      \ 'fallback': 'find %s/.. -type f'
    \ }
  endif

  " YouCompleteMe (Code Completion)
  "Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
  "let g:ycm_complete_in_comments_and_strings = 1
  "let g:ycm_collect_identifiers_from_comments_and_strings = 1
  "let g:ycm_autoclose_preview_window_after_completion = 1
  "let g:ycm_filepath_completion_use_working_dir = 1

  " Ultisnips (Code Snippets)
  Plug 'SirVer/ultisnips'
  noremap gu :UltiSnipsEdit!<CR>
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsListSnippets='<c-s>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<c-m>'

  " airline  (StatusBar)
  Plug 'bling/vim-airline'
  " tabline
  " let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
  "let g:airline#extensions#tabline#buffer_nr_show = 1
  "let g:airline#extensions#tabline#show_tab_nr = 1
  "let g:airline#extensions#tabline#buffer_nr_format = '%s:'
  "let g:airline_exclude_preview = 1
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
  let g:airline_powerline_fonts = 0
  let g:airline_theme='luna'
  let g:airline#extensions#whitespace#enabled = 0 "no Whitespace detection

  " delimitMate (auto-close chars)
  Plug 'Raimondi/delimitMate'
  let g:delimitMate_matchpairs = '(:),[:],{:}'
  let g:delimitMate_quotes = "\" ' ` | %"
  let g:delimitMate_expand_cr = 1

  " Gundo (Undo Tree)
  Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
  nnoremap  <leader>u :GundoToggle<CR>

  "Neomake (async make/lint)
  Plug 'benekastah/neomake'
  let g:neomake_javascript_enabled_makers = ['eslint']

  let g:neomake_warning_sign = {
      \ 'text': '?',
      \ 'texthl': 'WarningMsg'
      \ }
  let g:neomake_error_sign = {
      \ 'text': '!',
      \ 'texthl': 'ErrorMsg'
      \ }
  "let g:neomake_open_list = 1
  if has('nvim')
    autocmd! BufWritePost *.js Neomake
  endif


  " Tabular (text filtering and alignment (:Tab /[ =,... ]))
  Plug 'godlygeek/tabular', {'on': 'Tab'}

  " Surround (surrounding text ( cs[motion], insert: ysi[motion], entire line: yss))
  Plug 'tpope/vim-surround'

  " Unimpaired (pairs of handy bracket mappings)
  Plug 'tpope/vim-unimpaired'

  " vim-commentary (Comment and Uncomment with gcc)
  Plug 'tpope/vim-commentary'

  " vim-repeat
  Plug 'tpope/vim-repeat'

  " search for, substitute, and abbreviate multiple variants of a word 
  " and camel/snake case conversion
  Plug 'tpope/vim-abolish'

  " Ack (Ack for vim)
  Plug 'mileszs/ack.vim', {'on': 'Ack'}
  let g:ackprg = 'ag --nogroup --nocolor --column'


  " Trailertrash (identify and Irradicate unwanted whitespace at the end of the line (:Trim))
  Plug 'csexton/trailertrash.vim', {'on': 'Trim'}

  " Matchit (% matches for html, latex, ruby,...)
  Plug 'vim-scripts/matchit.zip'

  " SplitJoin (splits and joins multiple code lines)
  Plug 'AndrewRadev/splitjoin.vim'

  " Fugitive (Git Support for vim)
  " Plug 'tpope/vim-fugitive'


  " Covim (Collaborative Editing)
  "Plug 'FredKSchott/CoVim.git'

  " endwise (end structures automatically (ruby if end,...))
  Plug 'tpope/vim-endwise'

  " eunuch (unix commands inside vim)
  Plug 'tpope/vim-eunuch'


  " IndentLine (Show vertical line at each indent Level)
  let g:indentLine_char = '┆'
  Plug 'Yggdroot/indentLine'

  " Emmet (Zen Coding)
  " Plug 'mattn/emmet-vim'

  " function! s:zen_html_tab()
  "   let line = getline('.')
  "   if match(line, '<.*>') >= 0
  "     return "\<c-y>n"
  "   endif
  "   return "\<c-y>,"
  " endfunction

  " textobject user (define your own text objects)
  Plug 'kana/vim-textobj-user'

  " textobject indent (textobject for same indent level)
  Plug 'kana/vim-textobj-indent'

  " vim-over (substitute preview)
  " Plug 'osyo-manga/vim-over'


  " vim-over (substitute preview)
  " Plug 'osyo-manga/vim-over'

  " vim-tmux-navigator (c-hjkl navigation in vim and tmux, c-\ = previous)
  Plug 'christoomey/vim-tmux-navigator'

  " targets (more text objects z.b in])
  Plug 'wellle/targets.vim'

  " pandoc-syntax (Pandoc Syntax Highlighting)
  Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

  " vim-exchange (exchange with cx)
  Plug 'tommcdo/vim-exchange'


  " incsearch (Improved incremental searching for vim)
  Plug 'haya14busa/incsearch.vim'
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  " :h g:incsearch#auto_nohlsearch
  " Sets hlsearch off automatically
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

  "Verymagic option as default
  let g:incsearch#magic = '\v'

  let g:incsearch#consistent_n_direction = 1
  let g:incsearch#separate_highlight = 1


  Plug 'easymotion/vim-easymotion'
  " vim-sneak (s is 2 char f)
  "Plug 'justinmk/vim-sneak'
  "let g:sneak#use_ic_scs = 1

  " vim-shot-f (highlight next f,t,F,T chars)
  "Plug 'deris/vim-shot-f'
  "Plug 'unblevable/quick-scope'

  " vimux (send commands to tmux)
  "Plug 'benmills/vimux'

  " better js syntax{
  Plug 'othree/yajs.vim', { 'for' : ['javascript']}

  " deoplete (async completion)
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'Shougo/neco-syntax'
  " Plug 'Shougo/neoinclude.vim'
  " let g:deoplete#enable_at_startup = 1
  " set completeopt+=menuone

  " supertab (tab complete/tab insert)
  Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<c-n>"


  " Close html tags
  Plug 'alvan/vim-closetag'
  let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.html.erb,*.jsx"

  " show git adds/changes/deletes
  Plug 'airblade/vim-gitgutter'

  " indent navigation (=],...)
  Plug 'jeetsukumaran/vim-indentwise'
  "
  "File Explorer
  Plug 'scrooloose/nerdtree'
  let NERDTreeShowLineNumbers=1
  noremap \ :NERDTreeToggle<CR>

  " "Vim for writing
  " Plug 'reedes/vim-pencil', {'for': ['markdown','mkd','text']}
  " augroup pencil
  "   autocmd!
  "   autocmd FileType markdown,mkd call pencil#init()
  "   autocmd FileType text         call pencil#init()
  " augroup END

  Plug 'ReplaceWithRegister'

call plug#end()
filetype plugin indent on

colorscheme flatcolor

hi link GitGutterAdd DiffAdd
hi link GitGutterDelete DiffDelete
hi link GitGutterChange DiffChange
