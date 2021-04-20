set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
let mapleader = "r"


filetype plugin indent on    " required

Plugin 'majutsushi/tagbar'
autocmd filetype markdown nnoremap <F4> :TagbarToggle<CR>
autocmd filetype markdown nnoremap <F3> :w <bar> exec '!npx prettier --parser markdown --tab-width 4 --use-tabs true --write '.shellescape('%')<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1

Plugin 'SidOfc/mkdx'
let g:mkdx#settings     = { 'highlight': { 'enable': 1  },
            \ 'enter': { 'shift': 1  },
            \ 'links': { 'external': { 'enable': 1  }  },
            \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1  },
            \ 'fold': { 'enable': 1  } }

let g:markdown_folding = 1

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" bind alt 
execute "set <M-r>=\er"
let g:ctrlp_map = '<M-r>'
let g:ctrlp_cmd = 'CtrlPMRU'
execute "set <M-o>=\eo"
noremap <M-o> :CtrlP<CR>

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
set t_Co=256
set termguicolors
"colorscheme wombat256mod
"colorscheme kuroi
"colorscheme gruvbox
" 适合亮度高
colorscheme kuroi
"colo gotham256

"let g:two_firewatch_italics=1
"colo two-firewatch
"let g:airline_theme='twofirewatch' " 
set makeprg=g++\ -Wall\ -g\ %\ -o\ %<
let g:asyncrun_open = 8
"autocmd filetype cpp nnoremap <F2> :w <bar> exec '!clang++ -O1 -g -std=c++11 -fsanitize=address,bounds,unsigned-integer-overflow,signed-integer-overflow,undefined -fno-omit-frame-pointer '.shellescape('%').' -o '.shellescape('%:r').' && for d in *.in ; do ./'.shellescape('%:r').' < $d ; done'<CR>
"autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clang++ -O1 -g -std=c++11 -fsanitize=bounds,unsigned-integer-overflow,signed-integer-overflow,undefined -fno-omit-frame-pointer '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"-fsanitize=address 
let var='/int main/,$d'
let leetcode='/home/switch/.vscode-insiders/extensions/leetcode.vscode-leetcode-0.17.0/node_modules/vsc-leetcode-cli/bin/leetcode'
autocmd filetype cpp nnoremap <F2> :w <bar> exec '!clang++ -O1 -g -std=c++11 -fsanitize=address,bounds,unsigned-integer-overflow,signed-integer-overflow,undefined -fno-omit-frame-pointer '.shellescape('%').' && for d in *.in ; do ./a.out < $d ; done'<CR>
autocmd filetype cpp nnoremap <F3> :w <bar> exec '!sed '.shellescape(var).' '.shellescape('%').' > /tmp/tmp.cpp && proxychains -q '.shellescape(leetcode).' submit /tmp/tmp.cpp'<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clang++ -DDEBUG -O0 -g -std=c++11 -fsanitize=bounds,unsigned-integer-overflow,signed-integer-overflow,undefined -fno-omit-frame-pointer '.shellescape('%').' && ./a.out'<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!'<CR>
"autocmd filetype tex nnoremap <F4> :w <bar> exec '!pdflatex '.shellescape('%')<CR>
"autocmd filetype tex nnoremap <F5> :w <bar> exec '!evince ./'.shellescape('%:r.dvi').'> /dev/null 2>&1 &'<CR>
"autocmd filetype tex nnoremap <F5> :w <bar> exec '!evince ./'.shellescape('%:r.pdf').'> /dev/null 2>&1 &'<CR>
autocmd filetype tex nnoremap <F4> :w <bar> exec '!latexmk'<CR>
autocmd filetype tex nnoremap <F5> :w <bar> exec '!evince ./out/'.shellescape('%:r.pdf').'> /dev/null 2>&1 &'<CR>
autocmd filetype tex nnoremap <F6> :w <bar> exec '!texcount ./'.shellescape('%')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec 'AsyncRun /home/switch/miniconda3/bin/python ./'.shellescape('%')<CR>
autocmd filetype python nnoremap <F5> :w <bar> exec 'AsyncRun -mode=term -pos=right /home/switch/miniconda3/bin/python ./'.shellescape('%')<CR>
"nnoremap <c-w> :q <CR>
nnoremap <F2> :call asyncrun#quickfix_toggle(6)<cr>
