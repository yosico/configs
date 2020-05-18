" Installation:
"
" mkdir ~/.vim/pack/git-plugins/start
" cd ~/.vim/pack/git-plugins/start
" git clone https://github.com/vim-scripts/AutoComplPop         # popups for autocompleteion
" git clone https://github.com/jlanzarotta/bufexplorer          # switch buffers (Shift+j)
" git clone https://github.com/vim-scripts/Gentooish            # colorscheme
" git clone https://github.com/vim-airline/vim-airline          # customize status line
" git clone https://github.com/vim-airline/vim-airline-themes   # themes for status line
" git clone https://github.com/w0rp/ale                         # ASYNCHRONOUS LINT ENGINE
" git clone https://github.com/vim-scripts/LargeFile            # disble plugins for large files
" git clone https://github.com/terryma/vim-multiple-cursors     # edit multiple lines ( Ctrl+N )
" git clone https://github.com/sheerun/vim-polyglot             # syntaxes
" git clone https://github.com/mileszs/ack.vim                  # search word under cursor via ack Ctrl+\
" git clone https://github.com/ludovicchabant/vim-gutentags.git # ctags generator
" git clone https://github.com/ctrlpvim/ctrlp.vim               # find filename in directory, buffers, etc
" git clone https://github.com/luochen1990/rainbow              # brackets colors
" git clone https://github.com/easymotion/vim-easymotion        # motion shortcuts
" git clone https://github.com/tpope/vim-fugitive               # git commands
" git clone https://github.com/junegunn/gv.vim                  # git commits tree vrowser
" git clone https://github.com/airblade/vim-gitgutter           # git integration
"                                                               #     move:     ]+c, [+c
"                                                               #     preview:  \+hp
"                                                               #     stage:    \+hs
"                                                               #     undo:     \+hu

" ToDo:
" https://github.com/janko/vim-test                           # test runner

set nocompatible
set noswapfile
syntax on                                           " enable syntax highlighting
set number                                          " show line numbers
set laststatus=2                                    " always show statusline
set termencoding=utf-8                              " encoding is utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]   " make Backspace button work properly
set modeline                                        " allows to reade vim options from comments in file head and tail

"spaces and tabs
set tabstop=4
set shiftwidth=4
set fileformats=unix,dos
set expandtab
set foldmethod=indent
set foldlevelstart=20

let g:rainbow_active = 1
let g:rainbow_conf = { 'ctermfgs': ['yellow', 'magenta', 'blue', 'white', 'cyan', 'red'] }

"colors
set t_Co=256                                                 " enable 256-colors terminal
colorscheme gentooish                                        " set colorscheme
highlight Normal ctermbg=none                                " transparent background
highlight Function cterm=bold ctermfg=darkred                " finctions color is darkred
highlight Search 	cterm=none ctermbg=yellow ctermfg=black  " search highlight is yellow
highlight OverLength ctermbg=black ctermfg=red               " OverLength symbol will be red
highlight ErrorMsg cterm=none ctermbg=darkred ctermfg=white  " error messages will be darkred
highlight ALEError cterm=none ctermbg=darkred ctermfg=white  " linter error messages will be white on darkred

match OverLength /\%80v/ "highlight line width > 80 char

"spaces on line end
au BufNewFile,BufRead * let b:mendline=matchadd('ErrorMsg', '\s\+$', -1) "show
au BufWritePre * :%s/\s\+$//e                                            "remove

"AutoComplPop - completion popups
set completeopt=menuone,menu,longest " do not close popup if one match, show logest match first

"ctrlp - files serach
""let g:ctrlp_regexp = 1              "in rfegexp mode
let g:ctrlp_working_path_mode = 'a' "serach from directory of the current file,
                                    "unless it is a subdirectory of the cwdA
let g:ctrlp_follow_symlinks = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

"airline
let g:airline_theme = 'bubblegum'                           " airline theme
let g:airline_powerline_fonts = 1                           " use font with some special symbolsj
let g:airline#extensions#tabline#enabled = 1                " show tabs
let g:airline#extensions#tabline#formatter = 'jsformatter'  " tabs namig formatter


"disable autocompleteion in multiline mode
function! Multiple_cursors_before()
    AcpDisable
endfunction

function! Multiple_cursors_after()
    AcpEnable
endfunction

"change by regexp
nmap <S-s> :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>/gc

"make
map <S-m> :w<cr>:make<cr>:cw<cr>

"ack
map <C-\> :execute "Ack " . expand("<cword>") <CR>
"nnoremap <Leader>af :Ack  %<Left><Left>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"json
let g:vim_json_syntax_conceal = 0  " disable folding

"Hotkeys to switch between Buffers
nmap <S-j> <Esc>:BufExplorer<cr>
nmap <S-h> <Esc>:bp<cr><cr>
nmap <S-l> <Esc>:bn<cr><cr>

"gitgutter
set updatetime=100
set signcolumn=yes

"javascript
au BufNewFile,BufRead *.cjsi,*.json setfiletype javascript
au FileType javascript set ts=2 sw=2 expandtab sts=2

" go
au FileType go set ts=4 sw=4 expandtab! sts=4

"c++
au FileType cpp set makeprg=make\ -sj5

" auto create closing quotes
" inoremap ( ()<Esc>i
" inoremap { {}<Esc>i
" inoremap [ []<Esc>i
" inoremap ' ''<Esc>i
" inoremap " ""<Esc>i

" syntastic (linter)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_python_flake8_args='--ignore=E501'
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" let g:syntastic_python_checkers = ['flake8']




" fa - вперед к символу а
" Ta - назад к символу а
" [{ - к открывающей скобке
" ]} - к закрывающей скобке

" ma - установить маркер a
" `a - перейти к маркеру a

" qa - начать запись макроса a
" q  - завершить запись макроса
" @a - выполнить макросс а
" @@ - повторить последний макросс

" "ayy - скопировать в регистр a
" ctrl+n / ctrl+p - следующий / предыдущий вариант

" :ab [аббревиатура] [на что заменить]
" :una [аббревиатура] - удалить
" ctrl+v - отменить замену аббревиатуры

" gv - repeat last selection

" O - поменять конец выделения в режиме выделения
" Ctrl+[ = Esc
" ; - повторить движение
" , - движение в обратном направлениии
" Ctrl+o - выполнить одну команду из режима редактирования



" GPG
" Transparent editing of gpg encrypted files.
augroup encrypted
au!
" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
" Switch to binary mode to read the encrypted file
autocmd BufReadPre,FileReadPre      *.gpg set bin
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
" Switch to normal mode for editing
autocmd BufReadPost,FileReadPost    *.gpg set nobin
autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
" Convert all text to encrypted text before writing
autocmd BufWritePre,FileWritePre    *.gpg set bin
autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
" Undo the encryption so we are back in the normal text, directly
" after the file has been written.
autocmd BufWritePost,FileWritePost  *.gpg silent u
autocmd BufWritePost,FileWritePost  *.gpg set nobin
augroup END


" hide/show lines numbers and gitgutter signs
function! NumberNo()
  set nonumber
  set signcolumn=no
  map <F12> :call NumberYes()<CR>
endfunction

function! NumberYes()
  set number
  set signcolumn=yes
  map <F12> :call NumberNo()<CR>
endfunction
map <F12> :call NumberNo()<CR>

" run selection in bash
xnoremap <F11> :w !bash<cr>

" NIGHTMARE MODE
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" goto next/prev error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

set pastetoggle=<F2>
