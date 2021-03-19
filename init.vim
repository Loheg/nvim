let mapleader = " "


syntax on
set number
" 相对行号
set relativenumber

set encoding=utf-8

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 智能大小写
set smartcase
" 搜索忽略大小写
set ignorecase
" 搜索完成取消高亮
nnoremap <leader><CR> :nohlsearch<CR>

" colorscheme slate

" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=4
" 继承前一行的缩进方式，适用于多行注释
set autoindent

" 保持光标与顶部底部距离
set scrolloff=7

" 打开时回到离开位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

inoremap jj <Esc>

" Emacs
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>


" 切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" theme
colorscheme gruvbox
" theme

" airline
let g:airline_theme='gruvbox'
" airline

" nerdtree

nnoremap <leader>g :NERDTreeToggle<CR>
nnoremap <leader>v :NERDTreeFind<CR>

" nerdtree
" coc
"
"
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-vimlsp',
  	\ 'coc-tsserver',]

" Tab 补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" 触发补全
inoremap <silent><expr> <c-o> coc#refresh()

" Enter选择补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc
