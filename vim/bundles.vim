" Easy bundles editing with :EditBundles
command! BundlesEdit :edit ~/.vim/bundles.vim
noremap gb :BundlesEdit<CR>

call plug#begin('~/.vim/plugged')

 " Bundles{

    " Colorscheme (Colorscheme){
        Plug 'MaxSt/FlatColor'
        let g:flatcolor_termcolors = 16
    " }

    " ctrlp (open file with fuzzy search){
      Plug 'kien/ctrlp.vim'
      let g:ctrlp_map = '<leader>t'
      " noremap <leader>g :CtrlPTag<cr> for tags but diabled atm
      "let g:ctrlp_working_path_mode = 0 " Dont manage working directory
      let g:ctrlp_open_new_file = 'r' " ctrlp opens new file in current window
      let g:ctrlp_cache_dir='~/.vim/tmp/'
      let g:ctrlp_reuse_window='startify'
      let g:ctrlp_open_multiple_files = 'rr'
      let g:ctrlp_clear_cache_on_exit=1
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
    " }

    " YouCompleteMe (Code Completion){
        Plug 'Valloric/YouCompleteMe'
        let g:ycm_complete_in_comments_and_strings = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_filepath_completion_use_working_dir = 1
    " }

    " Ultisnips (Code Snippets){
        Plug 'SirVer/ultisnips'
        noremap gu :UltiSnipsEdit!<CR>

        function! g:UltiSnips_Complete()
            call UltiSnips#ExpandSnippet()
            if g:ulti_expand_res == 0
              call UltiSnips#JumpForwards()
              if g:ulti_jump_forwards_res == 0
                return "\<CR>"
              endif
            endif
            return ""
        endfunction

        au BufEnter * exec "inoremap <silent> <CR> <C-R>=g:UltiSnips_Complete()<cr>"
    " }

    " airline  (StatusBar){
        Plug 'bling/vim-airline'
        " tabline
        "let g:airline#extensions#tabline#enabled = 1
        "let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
        "let g:airline#extensions#tabline#buffer_nr_show = 1
        "let g:airline#extensions#tabline#buffer_nr_format = '%s:'
        let g:airline_exclude_preview = 1
        let g:airline_powerline_fonts = 0
        let g:airline_theme='sol'
        let g:airline#extensions#whitespace#enabled = 0 "no Whitespace detection

    " }

    " delimitMate (auto-close chars){
        Plug 'Raimondi/delimitMate'
        let g:delimitMate_matchpairs = '(:),[:],{:},<:>'
        let g:delimitMate_quotes = "\" ' ` | %"
    " }

    " Gundo (Undo Tree){
        Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
        nnoremap  <leader>u :GundoToggle<CR>
    " }

    " syntastic (show compiler errors after saving){
        "Plug 'scrooloose/syntastic'
        "let g:syntastic_auto_loc_list=1
    " }

    " Tabular (text filtering and alignment (:Tab /[ =,... ])){
        Plug 'godlygeek/tabular', {'on': 'Tab'}
    " }

    " Surround (surrounding text ( cs[motion], insert: ysi[motion], entire line: yss)){
        Plug 'tpope/vim-surround'
    " }

    " Unimpaired (pairs of handy bracket mappings){
        Plug 'tpope/vim-unimpaired'
    " }

    " vim-commentary (Comment and Uncomment with gcc){
        Plug 'tpope/vim-commentary'
    " }

    " Ack (Ack for vim){
        Plug 'mileszs/ack.vim', {'on': 'Ack'}
        let g:ackprg = 'ag --nogroup --nocolor --column'
    " }


    " Trailertrash (identify and Irradicate unwanted whitespace at the end of the line (:Trim)){
        Plug 'csexton/trailertrash.vim', {'on': 'Trim'}
    " }

    " Matchit (% matches for html, latex, ruby,...){
        Plug 'vim-scripts/matchit.zip'
    " }

    " IndexedSearch (#N out of M matches output when searching){
        Plug 'vim-scripts/IndexedSearch'
    " }

    " SplitJoin (splits and joins multiple code lines){
        "Plug 'AndrewRadev/splitjoin.vim.git'
    " }

    " Fugitive (Git Support for vim){
        " Plug 'tpope/vim-fugitive'
    " }

    " Multiple Cursors (with <C-N> while searching){
        Plug 'terryma/vim-multiple-cursors'
    " }

    " Covim (Collaborative Editing){
        "Plug 'FredKSchott/CoVim.git'
    " }


    " Startify (Vim Startscreen){
        Plug 'mhinz/vim-startify'
        autocmd FileType startify setlocal bt=
        let g:startify_custom_header = [
          \ '   ┌─────────────────────────────────┐',
          \ '   │     ┌────────┬───┬─┬──┬──┐      │',
          \ '   │     │        │  ─  ├─   ─┤      │',
          \ '   │     └──┴──┴──┴───┴─┴──┴──┘      │',
          \ '   └─────────────────────────────────┘',
          \ '',
          \ '',
          \ ]
        "Colors for Startify
        hi def link StartifyHeader Todo
        let g:startify_change_to_vcs_root = 1
    " }

    " endwise (end structures automatically (ruby if end,...)){
        Plug 'tpope/vim-endwise'
    " }

    " eunuch (unix commands inside vim){
        Plug 'tpope/vim-eunuch'
    " }


    " IndentLine (Show vertical line at each indent Level){
        " let g:indent_guides_auto_colors = 0
        " let g:indent_guides_enable_on_vim_startup = 1
        " "let g:indent_guides_guide_size = 1
        " Plug 'nathanaelkane/vim-indent-guides'
    " }

    " Emmet (Zen Coding){
        " Plug 'mattn/emmet-vim'

        " function! s:zen_html_tab()
        "   let line = getline('.')
        "   if match(line, '<.*>') >= 0
        "     return "\<c-y>n"
        "   endif
        "   return "\<c-y>,"
        " endfunction
    " }

    " textobject user (define your own text objects){
        Plug 'kana/vim-textobj-user'
    " }

    " textobject indent (textobject for same indent level){
        Plug 'kana/vim-textobj-indent'
    " }

    " vim-over (substitute preview){
        " Plug 'osyo-manga/vim-over'
    " }


    " vim-tmux-navigator (c-hjkl navigation in vim and tmux){
        Plug 'christoomey/vim-tmux-navigator'
    " }

    " targets (more text objects z.b in]){
        Plug 'wellle/targets.vim'
    " }

    " sensible (defaults everyone can agree on){
        Plug 'tpope/vim-sensible'
    " }

    " pandoc-syntax (Pandoc Syntax Highlighting){
        Plug 'vim-pandoc/vim-pandoc-syntax'
    " }

call plug#end()
filetype plugin indent on
color flatcolor
