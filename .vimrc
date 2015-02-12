""
"" Vundle Setup
""

set nocompatible                  " be iMproved, required
filetype off                      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Custom plugins
Plugin 'tomasr/molokai'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()                 " required
filetype plugin indent on         " required

""
"" Basic Setup
""

syntax enable                     " Turn on syntax highlighting allowing local overrides
set number                        " Show line numbers
set ruler                         " Show line and column number
set laststatus=2                  " Always show the status line
set colorcolumn=80                " Show vertical line at column 80
set encoding=utf-8                " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" List chars
""
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Key mappings
""

map <D-F> :Ack <space>
map <C-f> /

""
"" Theme
""

let g:molokai_original = 1        " enable the original monokai background colour
colorscheme molokai               " use the molokai theme

