" Couldn't find .vimrc anywhere else so creating it here

" Specify a directory for plugins
"call plug#begin('~/.vim/plugged')

" nerdtree
"Plug 'scrooloose/nerdtree'
"vim-colors-solarized this didn't work out so I switch to onedark
"Plug 'alteration/vim-colors/solarized'
"Plug 'joshdick/onedark.vim'
"Plug 'altercation/vim-colors-solarized'


"Plug 'Rigellute/rigel'

"airling status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"call plug#end()




syntax on
"colorscheme onedark "need to turn this back on, couldn't get it to work out of the box

"airline theme was set with
":AirlineTheme deus


"syntax enable
"set background=dark
"colorscheme vim-colors-solarized
"colorscheme solarized

""" enable 24bit true color for rigel theme
" according to https://stackoverflow.com/questions/62702766/termguicolors-in-vim-makes-everything-black-and-white
"need this for set termguicolors 
"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""" enable the theme for rigel
"syntax enable
"kcolorscheme rigel



"increase font size
set guifont=Monaco:h14

"relative line numbers
:set relativenumber
"set current line to absolute number
:set nu rnu

"show keystrokes in normal mode
:set showcmd

"remap ESC to jk
inoremap jk <Esc>

" vertical cursor in normal mode
" https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

"remove underscore from the definition of a word
:set iskeyword-=_
