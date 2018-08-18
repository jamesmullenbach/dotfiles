execute pathogen#infect()

""""" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""" END VUNDLE


filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"make space clear search highlighting
noremap <space> :noh

vnoremap > >gv
vnoremap < <gv

noremap j gj
noremap k gk

nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

"start scrolling when cursor is this many lines away from top/bottom
set so=7

"don't redraw until the end when doing a macro
set lazyredraw

"don't create .swp files
set noswapfile

"0 moves to first non-blank 
map 0 ^

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
   return "\<C-N>"
     else
         return "\<Tab>"
           endif
           endfunction
           :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
           :set dictionary="/usr/dict/words"

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
 
" Declare the list of plugins.
Plug 'drewtempelmeyer/palenight.vim'
 
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme palenight

let b:ale_fixers = {
\             'javascript': ['prettier', 'eslint'],
\             'python': ['isort', 'autopep8'],
\}
