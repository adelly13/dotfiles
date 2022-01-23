" ---------------------
" Basic editing config
" ---------------------
" esc mappings for exiting insert mode
inoremap jk <Esc>
inoremap kj <Esc>
let mapleader=','    " leader key!
nnoremap <silent> <leader>s :w<CR> " easy save
noremap <silent> <leader>h :nohlsearch<CR>    " stop search highlighting
set nocompatible
set clipboard=unnamed " use system clipboard
filetype on

" -----------------
" Syntax and indent
" -----------------
set autoindent
set showmatch    " show matching braces when text indicator is over them
set tabstop=2 shiftwidth=2 softtabstop=0 expandtab smarttab
syntax on    " enable syntax highlighting

" -----------------------
" Line Numbers and Length
" -----------------------
highlight ColorColumn ctermbg=234
set colorcolumn=80
set fo-=t
set nowrap
set number relativenumber
set nu rnu " hybrid line numbers
set tw=79

" ------
" Splits
" ------
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright

" ------
" Search
" ------
set hlsearch
set ignorecase    " smart case-sensitive search
set incsearch    " incremental search (as string is being typed)
set smartcase

" -----
" Pairs
" -----
inoremap <leader>" ""<left>
inoremap <leader>' ''<left>
inoremap <leader>( ()<left>
inoremap <leader>[ []<left>
inoremap <leader>{ {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" --------------------
" Miscellaneous config
" --------------------
set hidden
set laststatus=2
set noshowmode    " hide default status line
set shortmess+=I    " disable startup message
set updatetime=300 " shorter update time makes it seem faster
set shell=zsh\ -i

" install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ddfiletype indent on " indents for HTML
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim' " bottom status line
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" ------------------
" Plugin Preferences
" ------------------
colorscheme nord
" status line color
let g:lightline = {'colorscheme': 'nord'}
" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
nnoremap <silent> <leader>n :NERDTreeToggle<CR>:set nu rnu<CR>
" confirm completion with `<leader>,`
inoremap <expr> <leader>, pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" navigate the completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" coc language servers and other extensions
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-css',
    \ ]

" ---------
" Languages
" ---------
autocmd filetype cpp nnoremap <C-e> :w <bar> !clear && g++ -std=gnu++14 -O2 % -o %:p:h/%:t:r.exe && ./%:r.exe<CR>
