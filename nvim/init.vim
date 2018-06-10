set termguicolors
set number
set encoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

call plug#end()

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" deoplete 
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


set cursorline

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" " let g:ackprg = 'ag --nogroup --nocolor --column'




" " YCM
set completeopt-=preview


" " Save session
" " Buffers
set hidden

" " Fonts
" " set guifont=Roboto\ Mono\ Medium\ for\ Powerline\ 11
" " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
" set guifont=DejaVuSansMono\ Nerd\ Font\ 10

" " Ale

let g:ale_sign_warning = ''
let g:ale_sign_error = ''



" " ctrl p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendors'


" " NERDTree
let g:NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI=1

" " Theme

colorscheme gruvbox
set background=dark
map <silent> <C-n> :NERDTreeToggle<CR>

" " Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#formatter = 'unique_tail'


" " Vim search
set incsearch
set hlsearch
hi Search guibg=#282828
hi Search guifg=#fbf1c7
nnoremap <esc> :noh<return><esc>
