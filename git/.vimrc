filetype off

let vundle_readme = expand('~/.vim/bundle/Vundle.vim/README.md')
" Auto-installing Vundle
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'nanotech/jellybeans.vim'

call vundle#end()

filetype plugin indent on
syntax on

" Display line numbers
set number

" Search related settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" Always display the status bar
set laststatus=2
" Status line format
set statusline=
" flags and buf no
set statusline+=%*[%n%H%R%W]%*
" cut at start
set statusline+=\ %<
" path
set statusline+=\ %-40f\ %=
set statusline+=%#warningmsg#%m%*
" filetype
set statusline+=[%{strlen(&ft)?&ft:'none'}
" encoding
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}]
" line and column
set statusline+=%10((%l/%L,%c)%)
" percentage of file
set statusline+=\ %P

" Allow to change file even if the current one is not saved
set hidden

" Define the colorscheme to use
colorscheme jellybeans
