" don't bother with vi compatibility
syntax on
syntax enable
set et
set ai
set cin
set ru
set showmode
set number
set noignorecase
set shiftwidth=4
set tabstop=4
set wrapmargin=78
set textwidth=78
set sm
set ruler
set nocp
"set autoindent
"set smartindent
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
set scrolloff=3
set incsearch                                                " search as you type
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set smartcase                                                " case-sensitive search if any caps
set hlsearch

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


" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"filetype plugin indent on

set clipboard=unnamed

" Method 1 (for Xwindows and mswindows), this map is different from the one shown in vim documentation:
":noremap <LeftRelease> "+y<LeftRelease>

" These are so that we do not have to use middle click
set clipboard=unnamed
vnoremap y "+y

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 16
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h16
    elseif has("gui_win32")
        set guifont=Consolas:h16:cANSI
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
match OverLength /\%79v.\+/

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
