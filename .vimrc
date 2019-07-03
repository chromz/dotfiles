" True color
set termguicolors

set number
set encoding=utf-8
" Trailing whitespaces
hi ExtraWhitespace ctermbg=red guibg='#ffcf9e'
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'lervag/vimtex'
Plug 'ryanoasis/vim-devicons'
Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'Valloric/YouCompleteMe'
Plug 'matze/vim-meson'
Plug 'morhetz/gruvbox'
Plug '/usr/bin/fzf'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'Yggdroot/indentLine'
" Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'cseelus/vim-colors-lucid'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Badacadabra/vim-archery'
Plug 'whatyouhide/vim-gotham'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'

call plug#end()

set wildmode=longest,list,full
set wildmenu


packadd termdebug
let g:localvimrc_sandbox = 0
set maxmempattern=2000000
set synmaxcol=128

nnoremap <Leader>a :Rg<Space>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" " let g:ackprg = 'ag --nogroup --nocolor --column'

" Fancy stuff
"" Indentation
" set shiftwidth=4
" set tabstop=4

" IndentLine {{
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" }}

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" Indentation
set cindent
set cinoptions=(0,u0,U0

set timeoutlen=500
inoremap jj <Esc>

set cursorline
set colorcolumn=80
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
command! Bd :bp|:bd#


set list lcs=nbsp:␣,trail:·,tab:\\ ,space:·


" " Save session
" " Buffers
set hidden

" " Ale
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter%: %s'
" let g:ale_lint_delay = 1000
let g:ale_linters = {
\   'c': ['gcc', 'cppcheck', 'clangcheck', 'clangtidy'],
\}
let g:ale_c_build_dir_names = ['build', 'bin', 'builddir']


" Vimtex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme


" " FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
nnoremap <C-p> :Files <CR>
let g:fzf_layout = { 'down': '~20%' }


" " NERDTree
let g:NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable=""
let g:NERDTreeDirArrowCollapsible=""
map <silent> <C-n> :NERDTreeToggle<CR>
" " Theme
autocmd ColorScheme * hi ExtraWhitespace ctermbg=red guibg='#ffcf9e'
set background=dark
colorscheme quantum
" let g:palenight_terminal_italics=1


let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'CGBranch',
      \   'filetype': 'CFileType',
      \   'fileformat': 'CFileFormat'
      \ },
      \ }


function! CGBranch()
  let fugitivetext = fugitive#head()
  return (strlen(fugitivetext) > 0) ? fugitivetext . ' ' : ''
endfunction

function! CFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! CFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

set laststatus=2




" " Vim search
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><ESC>
set mouse=a
set ttymouse=xterm2
hi Comment gui=italic
hi ExtraWhitespace ctermbg=red guibg='#ffcf9e'
" hi Normal guibg=NONE ctermbg=NONE
match ExtraWhitespace /\s\+$/

" Indentation
set cindent
set cinoptions=(0,u0,U0
filetype plugin indent on
