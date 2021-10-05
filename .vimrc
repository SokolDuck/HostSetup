set nocompatible              " required
filetype off                  " required
set number
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set foldlevel=3
set showmatch
set cursorline
set autoindent

set foldmethod=indent
set backupdir=~/.cache/vim

" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'

Bundle 'preservim/nerdtree'
Bundle 'jaredgorski/spacecamp'
Bundle 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required

Bundle 'Xuyuanp/nerdtree-git-plugin'

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'Valloric/YouCompleteMe'

let g:NERDTreeNodeDelimiter = "\u00a0"

syntax on
set backspace=indent,eol,start

"split navigations

autocmd FileType python map <buffer> <F3> :w!<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w!<CR>:exec '!python3' shellescape(@%, 1)<CR>
"nnoremap <C-J> <C-W><C-J>   " Move bottom"
"nnoremap <C-K> <C-W><C-K>   " Move top "
"nnoremap <C-L> <C-W><C-L>   " Move right "
"nnoremap <C-H> <C-W><C-H>   " Move left "

" colorscheme spacecamp


" Setup nerdtree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

autocmd VimEnter * NERDTree | wincmd p    " Start NERDTree and put the cursor back in the other window.
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeShowHidden=1

let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeMapOpenInTab='<TAB>'



let g:python_highlight_all = 1


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



nnoremap <M-K> <CMD>m .-2<CR>
nnoremap <M-J> <CMD>m .+1<CR>
nnoremap <M-H> <<
nnoremap <M-L> >>

inoremap <M-H> <CMD>normal <<<CR>
inoremap <M-L> <CMD>normal >><CR>
inoremap <M-K> <CMD>m .-2<CR>
inoremap <M-J> <CMD>m .+1<CR>

vnoremap <M-K> :m '<-2<CR>gv
vnoremap <M-J> :m '>+1<CR>gv
vnoremap <M-H> <gv
vnoremap <M-L> >gv


"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

set exrc
set secure
