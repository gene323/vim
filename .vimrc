set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/youcompleteme'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"nerdTree"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"indentguides"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=240
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1

"ctrl + a auto compile "
map <C-A> :call CompileRun()<CR>
function! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "! gcc -o %<.out %"
        exec "! ./%<.out"
    elseif &filetype == 'cpp'
        exec "! g++ -o %<.out %"
        exec "! ./%<.out"
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'java'
        exec "!java %"
    endif
endfunction

"disable the beep sound"
set visualbell
set t_vb=

"color scheme"
colorscheme molokai

set encoding=utf8
set fileencoding=utf8
set number
set autoindent
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set hlsearch incsearch
set cindent
set cmdheight=1
set laststatus=2
"set linebreak"
set relativenumber
set showcmd
set mouse=a
hi LinNr ctermfg=green

inoremap ( ()<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap {{ {}<Esc>i
inoremap [ []<Esc>i
inoremap " <c-r>=QuotePair('"')<CR>
function! QuotePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char . a:char . "\<Esc>i"
    endif
endfunction

inoremap ) <c-r>=ClosePair(')')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

filetype indent on

highlight LineNr term=bold cterm=NONE ctermfg=green ctermbg=none gui=NONE guifg=DarkGrey guibg=NONE
syntax enable
