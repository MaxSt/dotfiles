" Plugins {
    " Use bundles config
    if filereadable(expand("~/.vim/bundles.vim"))
        source ~/.vim/bundles.vim
    endif
" }

" General {
    set viewoptions=folds,options,cursor,unix,slash               " better unix / windows compatibility
    set spelllang=en,de_at                                        " Set Language to German and English (for Spellchecking)
    set spellfile=~/.vim/spell/custom.utf-8.add                   " Set File for additional dictionary
    set nospell                                                   " spell checking off
    set backupdir=~/.vim/tmp
    set noswapfile                                                " no swap files
    set noautowrite
    set lazyredraw
    set hidden                                                    " lets you open multiple buffers without saving
    set wildignore+=*.xlsx,*.ico,*.png,*.jpg,*.gif,*.jpeg,*.xcf,*.xls,*.orig,*.swp,*.bak,*.pyc,*.class,*.obj,*.o,*.aux,*.odg,*.pdf
    set foldmethod=indent
    set nofoldenable
    let mapleader = ','                                           " Use Space as leader (insetead of the default '\')
" }

" Vim UI {
    set number                                                    " Views Line Numbers
    set relativenumber                                            " Views Line Numbers

    set guioptions-=T
    set guioptions-=r
    set guioptions-=e

    set cursorline                                                " highlight current line (performance issues)
    set cursorcolumn                                              " highlight current column (performance issues)

" }


" Formatting {
    set backspace=2                                             " more powerful backspacing
    set wrap                                                    " wrap long lines
    set shiftwidth=2                                            " use indents of 4 spaces
    set expandtab                                               " tabs are spaces, not tabs
    set tabstop=2                                               " an indentation every four columns
    set softtabstop=2                                           " let backspace delete indent
    set showmatch                                               " set show matching parenthesis
    set ignorecase                                              " ignore case (must be set for smartcase)
    set smartcase                                               " ignore case if search pattern is all lowercase,
    set hlsearch                                                " highlight search terms
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
    nnoremap ! :<C-u>b<C-r>=v:count<CR><CR> " nnoremap #! :b #<CR>

    " Map Space to Nothing (space is leader)
    noremap <,> <nop>

    " Map ; to : for faster command mode
    noremap ; :

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

    " Select last inserted text with <leader> i
    nmap <leader>i `[v`]


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


    augroup ECW_au
      au!
      au CmdwinEnter * noremap q :q<CR>
      au CmdwinLeave * unmap q
    augroup END

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

    "write file with <leader>w
    noremap <leader>w :update<CR>

    " go to end of search highlight
    noremap <silent> <leader>e /<c-r>//e<cr>:let @/='<c-r>/'<cr>


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
    nnoremap <silent> <leader>d :nohlsearch<CR>

    " diable visualbell
    autocmd GUIEnter * set vb t_vb=                               " for your GUI
    autocmd VimEnter * set vb t_vb=

    "set cole=2    " conceal level
    "set cocu=n  " conceal cursor /when set to n typing is not very pleasant/
    " Conceal in tex file: "admgs", a=accents, d=delimiters, m=math symbols,
    " g=Greek, s=superscripts/subscripts:
    "let g:tex_conceal="agm"

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

  " Define a command to make it easier to use
  command! -nargs=+ QFDo call QFDo(<q-args>)

  " Quick Fix Do (do command for all quick fix lines)
  " Function that does the work
  function! QFDo(command)
      " Create a dictionary so that we can
      " get the list of buffers rather than the
      " list of lines in buffers (easy way
      " to get unique entries)
      let buffer_numbers = {}
      " For each entry, use the buffer number as 
      " a dictionary key (won't get repeats)
      for fixlist_entry in getqflist()
          let buffer_numbers[fixlist_entry['bufnr']] = 1
      endfor
      " Make it into a list as it seems cleaner
      let buffer_number_list = keys(buffer_numbers)

      " For each buffer
      for num in buffer_number_list
          " Select the buffer
          exe 'buffer' num
          " Run the command that's passed as an argument
          exe a:command
          " Save if necessary
          update
      endfor
  endfunction
" }

