""""""""""""
" init.vim "
""""""""""""
" Config file for neovim.




"Base config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                               " syntax highlighting
set number                              " enable line numbers
set expandtab                           " expand tabs to spaces
set shiftwidth=4                        " spaces to shift when indent
set tabstop=4                           " How many spaces to insert when tab
set softtabstop=4                       " Backspace deletes spaces when indented
filetype plugin indent on               " Different indent filetypes
set smartindent                         " Indent based on filetype
set showmatch                           " Show matching brackets
set textwidth=79                        " Linebreak at 79
set colorcolumn=81                      " ruler at 81
set clipboard+=unnamedplus              " Default register is systemclipboard
set mouse=a                             " Scroll with mice

" EOL characters
set list                                " Show empty space
set listchars=tab:▸\ ,eol:¬             " Set empty space



" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" location for neovim
call plug#begin('~/.local/share/nvim/plugged')

  " NerdTree - file system explorer
  Plug 'https://github.com/scrooloose/nerdtree.git'

  " vim-airline - status line for vim
  Plug 'vim-airline/vim-airline'

  " vim-airline-themes - additional themes
  Plug 'vim-airline/vim-airline-themes'

  " colorscheme - theme pack
  Plug 'flazz/vim-colorschemes'

  " vim-misc - required for vim-easytags
  Plug 'xolox/vim-misc'

  " vim-easytags - automated tag generation and syntax highlighting
  "Plug 'xolox/vim-easytags'

  " Tagbar - class outline viewer for vim
  Plug 'majutsushi/tagbar'

  " nerd-commenter
  Plug 'scrooloose/nerdcommenter'

  " syntastic
  Plug 'scrooloose/syntastic'

  " vim-markdown - syntax highlight ++ for markdown
  Plug 'plasticboy/vim-markdown'

  " Vim autoclose (for brackets)
  ""Plug 'spf13/vim-autoclose'

  "Deoplete - auto complete for neovim
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " vim-go - golang integration
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()



" File handling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore certain filetypes
set wildignore=*.swp,*.bak,*.pyc,*.class



" Dev handling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use deoplete.
""let g:deoplete#enable_at_startup = 1
"call deoplete#enable()



" Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"true colors in the terminal
set termguicolors


" Theme
colorscheme molokai

" airline theme
let g:airline_theme='violet'
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1



" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl+n opens nerdtree
map <C-n> :NERDTreeToggle<CR>

" Toggle Tagbar
map <F8> :TagbarToggle<CR>

" remove ctrl+w + j to be only ctrl+j and so on
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
