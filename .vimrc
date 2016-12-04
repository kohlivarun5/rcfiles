" don't bother with vi compatibility
syntax on
syntax enable

set autoindent
set autoread    " reload files when changed on disk, i.e. via `git checkout`
set backspace=2 " Fix broken backspace in some setups
set backupcopy=yes " see :help crontab

set et
set ai
set cin
set ru
set showmode
set number
set noignorecase
" set cc=78

set shiftwidth=2
set tabstop=2
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set expandtab     " expand tabs to spaces
"set wrapmargin=78
"set textwidth=78

set sm
set ruler
set nocp
set autoindent
set smartindent

set backspace=2
set spell
set columns=78
set tags+=tags;$HOME
set noeb
set background=dark
colorscheme solarized
set nocompatible
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set number                                                   " show line numbers
set ruler                                                    " show where you are
"set scrolloff=3
set incsearch                                                " search as you type
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set smartcase                                                " case-sensitive search if any caps
set hlsearch
set encoding=utf-8
set ignorecase  
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

set autowrite

"set guioptions-=T  " Remove toolbar for gvim
set guioptions-=t
set guioptions-=m  "remove menu bar
"set guioptions-=r  "remove right-hand scroll bar


inoremap { {}<Esc>:let leavechar="}"<CR>i

syntax on
filetype on

" Enable basic mouse behavior such as resizing buffers.
if has("gui_running")
    if has("gui_macvim")
        set mouse=a
    elseif has("gui_win32")
        set mouse=a
    endif
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

autocmd BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.mfi,*.mf,*.ml,*.mli,*.mll,*.mly,.ocamlinit set ft=ocaml

set clipboard=unnamed

" Method 1 (for Xwindows and mswindows), this map is different from the one shown in vim documentation:
":noremap <LeftRelease> "+y<LeftRelease>

" These are so that we do not have to use middle click
set clipboard=unnamed
vnoremap y "+y

if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h16:cANSI
    elseif has("gui_macvim")
        set guifont=Fira\ Mono\ Medium:h14
    else 
        set guifont=Fira\ Mono\ Medium\ 14
    endif
endif

set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

filetype indent on
filetype plugin on

:map   <F5> :ls<CR>:e #
cmap fb<Space> FuzzyFinderBuffer<CR>
cmap fd<Space> FuzzyFinderDir<CR>
cmap fr<Space> FuzzyFinderMruFile<CR>
cmap ff<Space> FuzzyFinderFile<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%78v.\+/


"autocmd vimenter * NERDTree
let NERDTreeIgnore = ['\.pyc$']
let g:indent_guides_guide_size=1

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkslategray   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey99 ctermbg=4
"
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 24
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()
map <C-PageUp> :LargerFont<CR>

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()
map <C-PageDown> :SmallerFont<CR>

let jshint2_save = 1  

autocmd VimEnter * :Limelight

"map <C-s> :wa <bar> :make <bar> vert copen<CR>
command M make <bar> copen
command W make <bar> copen  

if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
