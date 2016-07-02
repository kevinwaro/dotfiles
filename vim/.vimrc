"VIM Configuration - Kevin HOARAU
" THIS IS MY PERSONNAL VIM CONFIGURATION FILE 
" I TAKE THOSE CONFIGURATIONS FROM MANY WEBSITES
" I'M USING ALSO MANY USEFUL PLUGINS AS 
" 	-PATHOGEN
" 	-NERDTREE
" 	-AIRLINE
" 	-SYNTASTIC
"AND THE MOLOKAI THEME

"""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""
" Enabling pathogen
execute pathogen#infect()

" Remember more commands and search history
set history=1000	

" Use many more levels of undo set undolevels=1000

" Enable filetype plugin
filetype plugin indent on

" Replacing the leader key \
"  by , key to do extra key combinations
let mapleader = ","   
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""
" => Vim user interface
"""""""""""""""""""""""""""
" Show current position
set ruler

" Turn off compatibility with Vi
set nocompatible

" Configure backspace so its acts as it should act
set backspace=indent,eol,start

"Height of the command bar
set cmdheight=2

" Ignore case when searching
set ignorecase		

" When searching try to be smart about cases 
set smartcase

" Make search act like in browsers
set incsearch

" Highlight search results 
set hlsearch

" Show matching brackets
set showmatch	

" Don't beep
set visualbell	
set noerrorbells	

" Disable orthographic correction
set nospell 		
	
"""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""
" Enabling syntax highlighting
syntax enable

" Setting the molokai scheme 
let g:rehash256 = 1
" Setting the number of colors to 256 for the terminal
set t_Co=256

" Use utf8 as standard encoding 
set encoding=utf8

" Use Unix as standard file type
set ffs=unix,dos


"""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""
" Turn off swap files and backups files
set noswapfile		
set nobackup

"""""""""""""""""""""""""""
" => Text, tab and indent
"""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Use tabs for indent, spaces for alignment
set smarttab

" 1 tab takes 4 spaces
set shiftwidth=4 
" Number of spaces per tab 
set tabstop=4
" Number of spaces in tab when editing
set softtabstop=4   


set ai "Auto indent	
set si "Smart indent

" Don't wrap lines
set nowrap	

""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and mappings
"""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
nnoremap j gj
nnoremap k gk

" Make the key tab to navigate brackets pairs
nnoremap <tab> % 	  
vnoremap <tab> %

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ? 

" The following will oblige you to use the hjkl keys (This is for good)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" The following makes easier navigation between terminals
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""
" => Status line 
"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Show line numbers
set number	

"show the mode in status line
set showmode		
set wildmenu
set cursorline

" Show (partial) command in status line.
set showcmd			
