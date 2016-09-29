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

  " " ctrlp (open file with fuzzy search)
  " Plug 'ctrlpvim/ctrlp.vim'
  " let g:ctrlp_map = '<leader>t'
  " let g:ctrlp_open_new_file = 'r' " ctrlp opens new file in current window
  " let g:ctrlp_cache_dir='~/.vim/tmp/'
  " " let g:ctrlp_reuse_window='startify'
  " let g:ctrlp_open_multiple_files = 'rr'
  " " let g:ctrlp_clear_cache_on_exit=1
  " let g:ctrlp_max_files = 10000
  " let g:ctrlp_follow_symlinks=1
  " nmap <leader>b :CtrlPBuffer<CR>
  " if executable('ag')
  "   let g:ctrlp_user_command = {
  "     \ 'types': {
  "     \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
  "     \ 2: ['.hg', 'hg --cwd %s locate -I .']
  "     \ },
  "     \ 'fallback': 'ag %s -l --nocolor -g ""'
  "   \ }
  " else
  "   let g:ctrlp_user_command = {
  "     \ 'types': {
  "       \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
  "       \ 2: ['.hg', 'hg --cwd %s locate -I .']
  "     \ },
  "     \ 'fallback': 'find %s/.. -type f'
  "   \ }
  " endif
  "

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'window': 'enew' }
  "let g:fzf_layout = { 'window': 'execute (tabpagenr()-1)."tabnew"' }
  let g:fzf_prefer_tmux=1
  set rtp+=~/.fzf
  "let g:fzf_layout = {} "tab layout

  nnoremap <silent> <leader>t :GitFiles<CR>
  nnoremap <silent> <Leader>b :Buffers<CR>

  " YouCompleteMe (Code Completion)
  " Plug 'Valloric/YouCompleteMe', {'do': './install.sh'}
  " let g:ycm_complete_in_comments_and_strings = 1
  " let g:ycm_collect_identifiers_from_comments_and_strings = 1
  " let g:ycm_autoclose_preview_window_after_completion = 1
  " let g:ycm_filepath_completion_use_working_dir = 1

  "let g:ycm_add_preview_to_completeopt=0
  "let g:ycm_confirm_extra_conf=0
  "set completeopt-=preview

  " Ultisnips (Code Snippets)
  Plug 'SirVer/ultisnips'
  noremap gu :UltiSnipsEdit!<CR>
  let g:UltiSnipsExpandTrigger='<tab>'
  let g:UltiSnipsListSnippets='<c-s>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

  " lightline  (StatusBar)
  Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \'colorscheme': 'flatcolor',
    \'active': {
      \'left': [ [ 'mode', 'fugitive' ],
       \          [ 'readonly', 'filename', 'modified'] ]
    \},
    \'component': {
      \'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \},
    \'separator': { 'left': '░', 'right': '░' },
    \'subseparator': { 'left': '〉', 'right': '〉' }
  \ }
      " \          [ 'readonly', 'filename', 'modified', 'parinfermode' ] ]
    " \'component_function': {
    "   \'parinfermode': 'LightLineParinferMode'
    " \},

  " function! LightLineParinferMode()
  "   if &filetype == "clojure"
  "     if g:parinfer_mode == "off"
  "       return "o"
  "     elseif g:parinfer_mode == "indent"
  "       return "⇆"
  "     elseif g:parinfer_mode == "hybrid"
  "       return "✱"
  "     else
  "       return "❪❫"
  "     endif
  "   else
  "     return ""
  "   endif
  " endfunction

  Plug 'cohama/lexima.vim' "(auto-close chars)

  Plug 'mbbill/undotree', {'on': 'UndotreeToggle'} " (Undo Tree)
  noremap <leader>u :UndotreeToggle<Cr>

  if has('nvim')
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
    autocmd BufEnter,BufWritePost *.js Neomake
    autocmd BufEnter,BufWritePost *.jsx Neomake
  endif


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
  " Plug 'dyng/ctrlsf.vim'
  " noremap <leader>s :CtrlSF 
   Plug 'mileszs/ack.vim', {'on': 'Ack'}
   let g:ackprg = 'ag --nogroup --nocolor --column'
  "Plug 'eugen0329/vim-esearch'


  " Trailertrash (identify and Irradicate unwanted whitespace at the end of the line (:Trim))
  Plug 'csexton/trailertrash.vim', {'on': 'Trim'}

  " Matchit (% matches for html, latex, ruby,...)
  Plug 'vim-scripts/matchit.zip'

  " SplitJoin (splits and joins multiple code lines)
  Plug 'AndrewRadev/splitjoin.vim'

  " Fugitive (Git Support for vim)
   Plug 'tpope/vim-fugitive'
   autocmd BufReadPost fugitive://* set bufhidden=delete


  " Covim (Collaborative Editing)
  "Plug 'FredKSchott/CoVim.git'


  " eunuch (unix commands inside vim)
  Plug 'tpope/vim-eunuch'


  " automatically sets conceallevel --> deactive
  " " IndentLine (Show vertical line at each indent Level)
  " Performance Problems
  " let g:indentLine_char = '┆'
  " let g:indentLine_indentLevel = 30
  " Plug 'Yggdroot/indentLine'

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

  " textobject indent (textobject [i] for same indent level)
  Plug 'kana/vim-textobj-indent'

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

  Plug 'haya14busa/vim-asterisk'
  "stay as default
  map *  <Plug>(asterisk-z*)
  map #  <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)
  "keep cursor position when iterating over matches
  let g:asterisk#keeppos = 1

  " vim-shot-f (highlight next f,t,F,T chars)
  "Plug 'deris/vim-shot-f'
  "Plug 'saihoooooooo/glowshi-ft.vim'
  " Plug 'justinmk/vim-sneak'
  "replace 'f' with 1-char Sneak
  " nmap f <Plug>Sneak_f
  " nmap F <Plug>Sneak_F
  " xmap f <Plug>Sneak_f
  " xmap F <Plug>Sneak_F
  " omap f <Plug>Sneak_f
  " omap F <Plug>Sneak_F
  "replace 't' with 1-char Sneak
  " nmap t <Plug>Sneak_t
  " nmap T <Plug>Sneak_T
  " xmap t <Plug>Sneak_t
  " xmap T <Plug>Sneak_T
  " omap t <Plug>Sneak_t
  " omap T <Plug>Sneak_T

  "Plug 'unblevable/quick-scope'
  "let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  " vimux (send commands to tmux)
  "Plug 'benmills/vimux'

  " better js syntax{
  "Plug 'othree/yajs.vim', { 'for' : ['javascript']}
  "
  Plug 'sheerun/vim-polyglot'

  " deoplete (async completion)
   Plug 'Shougo/deoplete.nvim'
  " Plug 'Shougo/neco-syntax'
  " Plug 'Shougo/neoinclude.vim'
   let g:deoplete#enable_at_startup = 1
  " set completeopt+=menuone

  " supertab (tab complete/tab insert)
  Plug 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<c-n>"


  " Close html tags
  Plug 'alvan/vim-closetag'
  let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.html.erb,*.jsx"

  " show git adds/changes/deletes
  Plug 'airblade/vim-gitgutter'
  "let g:gitgutter_sign_column_always = 1

  "turn off signs
  let g:gitgutter_map_keys = 0
  let g:gitgutter_highlight_lines = 0
  let g:gitgutter_signs = 0
  "jump to next/previous hunk(change)
  nmap ]c <Plug>GitGutterNextHunk
  nmap [c <Plug>GitGutterPrevHunk
  "stage and revert hunk
  nmap <Leader>ga <Plug>GitGutterStageHunk
  nmap <Leader>gu <Plug>GitGutterRevertHunk

  " indent navigation (=],...)
  Plug 'jeetsukumaran/vim-indentwise'
  "
  "File Explorer
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFocus' }
  let NERDTreeShowLineNumbers=1
  let NERDTreeMinimalUI=1
  let NERDTreeQuitOnOpen=0
  noremap \ :NERDTreeFocus<CR>

  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeFocus' }
  let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "~",
        \ "Staged"    : "✚",
        \ "Untracked" : "U",
        \ "Renamed"   : "r",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }

  "Plug 'justinmk/vim-dirvish'

  " "Vim for writing
  " Plug 'reedes/vim-pencil', {'for': ['markdown','mkd','text']}
  " augroup pencil
  "   autocmd!
  "   autocmd FileType markdown,mkd call pencil#init()
  "   autocmd FileType text         call pencil#init()
  " augroup END

  Plug 'ReplaceWithRegister'

  Plug 'junegunn/vim-peekaboo'

  if has('nvim')
    Plug 'neovim/node-host', { 'dir': '~/.vim/plugged/node-host', 'do': 'npm install' }
  end

  Plug 'guns/vim-clojure-static'
  let g:clojure_align_multiline_strings = 1
  let g:clojure_align_subforms = 1
  "Plug 'guns/vim-clojure-highlight'

  Plug 'luochen1990/rainbow'
  let g:rainbow_conf = {
  \   'guifgs': ['#95ffa4', '#91ddff', '#ffe9aa', '#aaffe4', '#c991e1', '#ff8080'],
  \   'operators': '_,_',
  \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \   'separately': {
    \       'html': 0
    \   }
  \}
  let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  let g:sexp_enable_insert_mode_mappings = 0
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

  " Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }
  " let g:paredit_leader = '\'
  " let g:paredit_electric_return = 0

  if has('nvim')
    Plug 'snoe/clj-refactor.nvim', { 'for': 'clojure' }
    " Plug 'snoe/nvim-parinfer.js', { 'for': 'clojure' }
    autocmd FileType clojure let b:lexima_disabled = 1
    " let g:parinfer_airline_integration = 0
    " let g:parinfer_mode = "indent"

    " function! ToggleParinferMode()
    "   if g:parinfer_mode == "indent"
    "     let g:parinfer_mode = "paren"
    "   " elseif g:parinfer_mode == "paren"
    "   "   let g:parinfer_mode = "hybrid"
    "   else
    "     let g:parinfer_mode = "indent"
    "   endif
    " endfunction
    " noremap <silent> gm :call ToggleParinferMode()<CR>
  end

  Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
  source ~/.vim/tmp/dbconf.vim

  Plug 'lervag/vimtex', {'for': 'tex'}
  let g:vimtex_fold_enabled=0
  let g:vimtex_mappings_enabled=0
  autocmd FileType tex,bib noremap <buffer> <space>v :VimtexView<cr>
  autocmd FileType tex,bib noremap <buffer> <space>t :VimtexTocOpen<cr>

  Plug 'ap/vim-css-color'
  autocmd FileType clojure call css_color#init('hex', 'extended', 'clojureString')

  Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

  Plug 'jpalardy/vim-slime'
  let g:slime_target = "neovim"
  let g:slime_no_mappings  = 1
  xmap <leader>e <Plug>SlimeRegionSend
  nmap <leader>e <Plug>SlimeMotionSend
  nmap <leader>ee <Plug>SlimeLineSend

  Plug 'kopischke/vim-fetch'

  Plug 'junegunn/gv.vim'

  if has('nvim')
    Plug 'kassio/neoterm'
  end

  Plug 'chrisbra/csv.vim', { 'for': 'csv' }

  Plug 'rhysd/vim-grammarous'

  Plug 'justinmk/vim-gtfo'

call plug#end()
filetype plugin indent on

colorscheme flatcolor

hi link GitGutterAdd DiffAdd
hi link GitGutterDelete DiffDelete
hi link GitGutterChange DiffChange
