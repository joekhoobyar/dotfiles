set nocompatible
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"
"
"Plugin 'elzr/vim-json'
"Plugin 'chase/vim-ansible-yaml'

"" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

let g:ansible_options = {'documentation_mapping': '<C-K>'}

set encoding=utf-8
set autoindent mouse=a
set shiftwidth=4 tabstop=4 expandtab
set visualbell

" settings: general programming.
"set tags=~/tags
"set complete=.,w,b,u,t,i
"let g:EnhCommentifyRespectIndent = 'Yes'
"let g:EnhCommentifyMultiPartBlocks = 'Yes'
"let g:EnhCommentifyUseSyntax = 'Yes'

" settings: ruby programming.
autocmd BufNewFile,BufRead *.scss set sw=2 ts=2
autocmd BufNewFile,BufRead *.sass set sw=2 ts=2
autocmd BufNewFile,BufRead *.html set sw=2 ts=2
autocmd BufNewFile,BufRead *.rake set sw=2 ts=2 ft=ruby
autocmd BufNewFile,BufRead *.rb set sw=2 ts=2
autocmd BufNewFile,BufRead *.thor set sw=2 ts=2 ft=ruby
autocmd BufNewFile,BufRead Rakefile set ft=ruby sw=2 ts=2 makeprg="rake"
autocmd BufNewFile,BufRead Capfile set ft=ruby sw=2 ts=2 makeprg="cap"
autocmd BufNewFile,BufRead Gemfile set ft=ruby sw=2 ts=2 makeprg="bundle"
autocmd BufNewFile,BufRead Guardfile set ft=ruby sw=2 ts=2
autocmd BufNewFile,BufRead Thorfile set ft=ruby sw=2 ts=2 makeprg="thor"
autocmd BufNewFile,BufRead *.gemspec set ft=ruby sw=2 ts=2

" settings: java programming.
set	sm
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
autocmd BufNewFile,BufRead *.n set ft=nasm sw=8
"autocmd BufNewFile,BufRead *.java set makeprg="mvn"
"autocmd BufNewFile,BufRead *.java set efm=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
"%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufNewFile,BufRead *.lex.in set ft=c sw=2 ts=2

autocmd BufNewFile,BufRead *.less set ft=less sw=4
autocmd BufNewFile,BufRead .envrc set ft=sh sw=4

" plugin: HTML/XML tag matching.
"source $VIMRUNTIME/macros/matchit.vim
set mouse=cvh

autocmd BufNewFile,BufRead *.rpkg set ft=sh
autocmd BufNewFile,BufRead *.rl set sw=2 ts=2 ft=ragel

autocmd BufNewFile,BufRead nginx.conf set ft=nginx
autocmd BufNewFile,BufRead nginx.d/* set ft=nginx

autocmd BufNewFile,BufRead *.json set ft=json

syntax enable
colorscheme darkblue
syntax enable
