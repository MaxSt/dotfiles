" Easy bundles editing with :EditBundles
command! EditBundles :edit ~/.vim/bundles.vim
" Auto - Reload this File
autocmd! bufwritepost bundles.vim source %

 " Bundles{

    " Vundler {
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
      " let Vundle manage Vundle
      " required!
        Bundle 'gmarik/vundle'
    " }

    " NERDTree (Filetree){
        Bundle 'scrooloose/nerdtree.git'
        " autocmd VimEnter * NERDTree           "Open NERDTree on Startup
        let NERDTreeQuitOnOpen = 1                              " Closes NERDTree After Opening a file
        noremap <silent> \ :NERDTreeToggle<CR>                  " open/close Nerdtree on ctrl + m
    " }

    " Ultisnips (Code Snippets){
        Bundle 'SirVer/ultisnips'
        " add support_funtions to snipptes
        " let g:UltiSnipsSnippetsDir = '~/.vim/mySnippets'
        let g:UltiSnipsExpandTrigger =" <c-space>"
        " :SnipEdit zum editierten
        command! -nargs=? SnipsEdit :call UltiSnipsEdit(<q-args>)
    " }

    " MiniBufExplorer (Buffertabs){
        Bundle 'fholgado/minibufexpl.vim.git'
        " Set Hotkeys for Buffer Switching
        noremap ]b :MBEbf<CR>
        noremap [b :MBEbb<CR>
        noremap <leader>x :MBEbd<CR>
        let g:miniBufExplCycleArround = 1
        let g:miniBufExplCheckDupeBufs = 0                    " faster for many buffers
        let g:miniBufExplUseSingleClick = 1                   " single click for buffer switching
    " }

    " ctrlp (open file with fuzzy search){
        Bundle 'kien/ctrlp.vim.git'
        let g:ctrlp_map = '<leader>t'
        " noremap <leader>g :CtrlPTag<cr> for tags but diabled atm
        let g:ctrlp_working_path_mode = 0                       " Dont manage working directory
        let g:ctrlp_open_new_file = 'r'                         " ctrlp opens new file in current window
        let g:ctrlp_open_multiple_files = 'rr'
        let g:ctrlp_user_command = 'find %s -type f'
        " let g:ctrlp_extensions = ['tag'] for tags but disabled atm
    " }

    " Powerline (StatusBar){
        "Bundle 'Lokaltog/powerline.git' "new Version but still too slow
        Bundle 'Lokaltog/vim-powerline.git'
        " set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
        "let g:Powerline_symbols = 'fancy'
        autocmd! bufwritepost .vimrc PowerlineReloadColorscheme " reload poerline colorscheme when .vimrc is written
    " }

    " Intent-Guides (show indent lines (binding: ,ig)) {
        Bundle 'nathanaelkane/vim-indent-guides'
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }

    " delimitMate (auto-close chars){
        Bundle 'Raimondi/delimitMate'
        let delimitMate_matchpairs = '(:),[:],{:},<:>'
    " }

    " Gundo (Undo Tree){
        Bundle 'sjl/gundo.vim.git'
        nnoremap  <leader>u :GundoToggle<CR>
    " }

    " syntastic (show compiler errors after saving){
        Bundle 'scrooloose/syntastic'
        let g:syntastic_auto_loc_list=1
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
    " }

    " vim-easy-align (easy alignment by seperators){
        Bundle 'junegunn/vim-easy-align.git'
        vnoremap <silent> <Enter> :EasyAlign<cr>
    " }

    " vim-easymotion (move with <leader><leader>[motion]){
        Bundle 'Lokaltog/vim-easymotion.git'
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

    " NerdCommenter (Comment and Uncomment with <leader>cc){
        Bundle 'scrooloose/nerdcommenter.git'
    " }

    " YankRing (Circle with <ctrl>p){
        Bundle 'vim-scripts/YankRing.vim.git'
    " }

    " Ack (Ack for vim){
        Bundle 'mileszs/ack.vim.git'
    " }

    " CSS-Color (Show Colorcodes in Color){
        Bundle 'skammer/vim-css-color.git'
    " }

    " Trailertrash (identify and Irradicate unwanted whitespace at the end of the line (:Trim)){
        Bundle 'csexton/trailertrash.vim.git'
    " }

    " XML (xml plugin (% matches, closing tags,..)){
        Bundle 'othree/xml.vim.git'
    " }

    " Matchit (% matches for html, latex, ruby,...){
        Bundle 'vim-scripts/matchit.zip.git'
    " }

    " IndexedSearch (#N out of M matches output when searching){
        Bundle 'vim-scripts/IndexedSearch.git'
    " }

    " SplitJoin (splits and joins multiple code lines){
        Bundle 'AndrewRadev/splitjoin.vim.git'
    " }

    " Solarized (vim solarized color scheme){
        "Bundle 'altercation/vim-colors-solarized'
    " }

    " Fugitive (Git Support for vim){
        Bundle 'tpope/vim-fugitive.git'
    " }

    " Multiple Cursors (with <C-N> while searching){
        Bundle 'terryma/vim-multiple-cursors.git'
    " }

    " Eunuch (UNIX shell commands in VIM){
        Bundle 'tpope/vim-eunuch.git'
    " }

    " Covim (Collaborative Editing){
        Bundle 'FredKSchott/CoVim.git'
    " }

    " Molokai Colorscheme (Colorscheme){
        Bundle 'tomasr/molokai.git'
    " }

    " Startify (Vim Startscreen){
        Bundle 'mhinz/vim-startify.git'
    " }
    
" }


" Tutorial{
    " -----------------------------------------
    " original repos on github
    " -----------------------------------------
    " Bundle 'tpope/vim-fugitive.git'
    " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}


    " -----------------------------------------
    " vim-scripts repos
    " -----------------------------------------
    " Bundle 'L9'
    " Bundle 'FuzzyFinder'



    " -----------------------------------------
    " non github repos
    " -----------------------------------------
    " Bundle 'git://git.wincent.com/command-t.git'
"}


