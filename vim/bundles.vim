" Easy bundles editing with :EditBundles
command! BundlesEdit :edit ~/.vim/bundles.vim
noremap gb :BundlesEdit<CR>

 " Bundles{
    " Vundler {
        filetype off
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
      " let Vundle manage Vundle
      " required!
        Bundle 'gmarik/vundle'
        filetype plugin indent on
    " }

    " Colorscheme (Colorscheme){
        Bundle 'MaxSt/FlatColor'
        color flatcolor
        let g:flatcolor_cursorlinebold = 1
    " }


    " Ultisnips (Code Snippets){
        Bundle 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger ="<c-j>"
        noremap gu :UltiSnipsEdit!<CR>
    " }


    " ctrlp (open file with fuzzy search){
        Bundle 'kien/ctrlp.vim.git'
        let g:ctrlp_map = '<leader>t'
        " noremap <leader>g :CtrlPTag<cr> for tags but diabled atm
        "let g:ctrlp_working_path_mode = 0                       " Dont manage working directory
        let g:ctrlp_open_new_file = 'r'                         " ctrlp opens new file in current window
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
            \ 'fallback': 'ag  %s -l --nocolor -g ""'
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

    " airline  (StatusBar){
        Bundle 'bling/vim-airline.git'
        " tabline
        "let g:airline#extensions#tabline#enabled = 1
        "let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
        "let g:airline#extensions#tabline#buffer_nr_show = 1
        "let g:airline#extensions#tabline#buffer_nr_format = '%s:'
        let g:airline_exclude_preview = 1
        let g:airline_powerline_fonts = 1
        let g:airline_theme='powerlineish'
        let g:airline#extensions#whitespace#enabled = 0 "no Whitespace detection

    " }

    " delimitMate (auto-close chars){
        Bundle 'Raimondi/delimitMate'
        let g:delimitMate_matchpairs = '(:),[:],{:},<:>'
        let g:delimitMate_quotes = "\" ' ` | %"
    " }

    " Gundo (Undo Tree){
        Bundle 'sjl/gundo.vim.git'
        nnoremap  <leader>u :GundoToggle<CR>
    " }

    " syntastic (show compiler errors after saving){
        "Bundle 'scrooloose/syntastic'
        "let g:syntastic_auto_loc_list=1
    " }

    " TableMode (make tables: TableModeEnable and |){
        Bundle 'dhruvasagar/vim-table-mode.git'
        let g:table_mode_toggle_map='<C-t>m'
        let g:table_mode_cell_text_object='<C-t>c'
        let g:table_mode_delete_row_map='<C-t>dd'
        let g:table_mode_delete_column_map='<C-t>tdc'
        let g:table_mode_map_prefix='<C-t>'
        let g:table_mode_tableize_map='<C-t>t'
    " }

    " YouCompleteMe (Code Completion){
        Bundle 'Valloric/YouCompleteMe.git'
        let g:ycm_complete_in_comments_and_strings = 1
        let g:ycm_collect_identifiers_from_comments_and_strings = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_filepath_completion_use_working_dir = 1
    " }


    " Tabular (text filtering and alignment (:Tab /[ =,... ])){
        Bundle 'godlygeek/tabular.git'
    " }

    " Surround (surrounding text ( cs[motion], insert: ysi[motion], entire line: yss)){
        Bundle 'tpope/vim-surround.git'
    " }

    " Unimpaired (pairs of handy bracket mappings){
        Bundle 'tpope/vim-unimpaired.git'
    " }

    " vim-commentary (Comment and Uncomment with gcc){
        Bundle 'tpope/vim-commentary.git'
    " }

    " Ack (Ack for vim){
        Bundle 'mileszs/ack.vim.git'
        let g:ackprg = 'ag --nogroup --nocolor --column'
    " }


    " Trailertrash (identify and Irradicate unwanted whitespace at the end of the line (:Trim)){
        Bundle 'csexton/trailertrash.vim.git'
    " }

    " Matchit (% matches for html, latex, ruby,...){
        Bundle 'vim-scripts/matchit.zip.git'
    " }

    " IndexedSearch (#N out of M matches output when searching){
        Bundle 'vim-scripts/IndexedSearch.git'
    " }

    " SplitJoin (splits and joins multiple code lines){
        "Bundle 'AndrewRadev/splitjoin.vim.git'
    " }

    " Fugitive (Git Support for vim){
        "Bundle 'tpope/vim-fugitive.git'
    " }

    " Multiple Cursors (with <C-N> while searching){
        Bundle 'terryma/vim-multiple-cursors.git'
    " }

    " Covim (Collaborative Editing){
        "Bundle 'FredKSchott/CoVim.git'
    " }


    " Startify (Vim Startscreen){
        Bundle 'mhinz/vim-startify.git'
        autocmd FileType startify setlocal bt=
        let g:startify_custom_header = [
          \ '      .--------.---.-.--.--.',
          \ '      |        |  _  |_   _|',
          \ '      |__|__|__|___._|__.__|',
          \ '',
          \ '   =================================================',
          \ '',
          \ ]
        "Colors for Startify
        hi def link StartifyHeader Todo
        let g:startify_change_to_vcs_root = 1
    " }

    " endwise (end structures automatically (ruby if end,...)){
        Bundle 'tpope/vim-endwise.git'
    " }

    " eunuch (unix commands inside vim){
        Bundle 'tpope/vim-eunuch.git'
    " }

    " sneak (2 character search){
        Bundle 'justinmk/vim-sneak.git'

        "EasyMotion like sneak
        "let g:sneak#streak = 1

        " 1-character _inclusive_ Sneak (for enhanced 'f')
        nmap f <Plug>Sneak_f
        nmap F <Plug>Sneak_F
        " visual-mode
        xmap f <Plug>Sneak_f
        xmap F <Plug>Sneak_F
        " operator-pending-mode
        omap f <Plug>Sneak_f
        omap F <Plug>Sneak_F

        " character _exclusive_ Sneak (for enhanced 't')
        nmap t <Plug>Sneak_t
        nmap T <Plug>Sneak_T
        " visual-mode
        xmap t <Plug>Sneak_t
        xmap T <Plug>Sneak_T
        " operator-pending-mode
        omap t <Plug>Sneak_t
        omap T <Plug>Sneak_T
    " }

    " IndentLine (Show vertical line at each indent Level){
        "Slows down vim too much
        "Bundle 'Yggdroot/indentLine.git'
    " }

    " Emmet (Zen Coding){
        Bundle 'mattn/emmet-vim.git'

        function! s:zen_html_tab()
          let line = getline('.')
          if match(line, '<.*>') >= 0
            return "\<c-y>n"
          endif
          return "\<c-y>,"
        endfunction
        "autocmd FileType html,*.html.*,*.html,xml,*.xml.*,*.xml imap <buffer><expr><c-l> <sid>zen_html_tab()
        "autocmd FileType html,*.html.*,*.html,xml,*.xml.*,*.xml nmap <buffer><expr><c-l> <sid>zen_html_tab()
        "autocmd FileType html,*.html.*,*.html,xml,*.xml.*,*.xml vmap <buffer><c-l> <c-y>,
    " }

    " textobject user (define your own text objects){
        Bundle 'https://github.com/kana/vim-textobj-user.git'
    " }

    " textobject indent (textobject for same indent level){
        Bundle 'https://github.com/kana/vim-textobj-indent.git'
    " }

    " vim-over (substitute preview){
        Bundle 'https://github.com/osyo-manga/vim-over.git'
    " }


    " vim-tmux-navigator (c-hjkl navigation in vim and tmux){
        Bundle 'christoomey/vim-tmux-navigator'
    " }

    " targets (more text objects z.b in]){
        Bundle 'wellle/targets.vim'
    " }

    " sensible (defaults everyone can agree on){
        Bundle 'tpope/vim-sensible'
    " }
" }
