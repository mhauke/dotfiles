""""""""""""""""""
"""  BASIC INFO
""""""""""""""""""
"
" Maintainer: Marko Hauke
"
" Sections:
"    -> BASIC INFO
"    -> LEADER
"    -> PLUGIN
"    -> COLOR
"    -> GENERAL
"    -> MAP
"    -> STATUS LINE
"    -> MISC
"
""""""""""""""""""""""""
"""  FIRST THING FIRST
""""""""""""""""""""""""

" Don't try to be vi compatible (must be set first)
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Don't wrap files
set nowrap

" Encoding
set encoding=utf-8

" Plugins essential
syntax on
filetype plugin indent on 

"""""""""""""""""""""
"""  LEADER
"""""""""""""""""""""
let mapleader=","
let g:mapleader=","

" General leader map
nnoremap <leader><space> :let @/=''<cr>  " Clear search
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :wq<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>v <C-w>v<C-W>l   " Split then move to the split
nnoremap <leader>n :bnext<cr>    " Next
nnoremap <leader>N :bprev<cr>    " Prev

" List all buffers
nnoremap <leader>b :CTRLPBuffer<cr>

" Toggle paste mode when you want to paste from outside source
set pastetoggle=<leader>p

""""""""""""""""""""""
""" PLUGIN
""""""""""""""""""""""

" Load vim-plug
so ~/.vim/plugins.vim



" Rainbow Parentheses Improved
let g:rainbow_active = 1

" Lightline
"set g:lightline = {
"   \ 'colorscheme': 'nord',
"    \ }

