set nocompatible               " be iMproved
filetype off                   " required!

" ---------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" plugins
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'
Bundle 'sjl/gundo.vim'
Bundle 'vim-ruby/vim-ruby'
nnoremap <F5> :GundoToggle<CR>

Bundle 'duskhacker/sweet-rspec-vim'
map <leader>R :SweetVimRspecRunFile<CR>
map <leader>r :SweetVimRspecRunFocused<CR>

Bundle 'sukima/xmledit'
map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>

Bundle 'heartsentwined/vim-emblem'

" ---------------------------
" config
syntax on
filetype plugin indent on
let mapleader = " "
set wrap
set number
set history=1000
set backspace=indent,eol,start
set nopaste

autocmd FileChangedShell * echo "File changed, press F9 to reload."

autocmd CursorHold * call Timer()
function! Timer()
    call feedkeys("f\e")
    checktime
endfunction
set updatetime=1000  " milliseconds

autocmd CursorHoldI * call TimerI()
function! TimerI()
    call feedkeys("\<C-R>\e")
    checktime
endfunction

" Basic tab behavior
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" themes / colors
set term=xterm-256color
set background=dark


nnoremap <leader>sc :set spell!<CR>
nnoremap <leader>hs :set hls!<CR>

" statusline:
set laststatus=2
set noswapfile

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%{fugitive#statusline()}
set statusline+=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" ---------------------------
" Backup

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*


" ----------------------------
" File mutations

match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" ----------------------------
" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t

" ----------------------------
" File types

au BufRead,BufNewFile Vagrantfile,Berksfile,Gemfile,Hanfile setfiletype ruby

" Key Bindings
map <Leader>n :NERDTreeToggle<CR>

