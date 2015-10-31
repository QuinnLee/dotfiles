set nocompatible               " be iMproved
filetype off                   " required!

" ---------------------------
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'rizzatti/dash.vim'

" plugins
Bundle 'digitaltoad/vim-jade'
Bundle 'jeetsukumaran/vim-buffergator'
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
Bundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'
Bundle 'sjl/gundo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'sentientmachine/Pretty-Vim-Python'
Bundle 'pangloss/vim-javascript'
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
set ttyfast

let g:NERDTreeWinSize=20

" set cursor to middle of screen
set so=999

" yank to clipboard
map <Leader>y :w !pbcopy<CR><CR>


autocmd FileChangedShell * echo "File changed, press F9 to reload."

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

set timeout timeoutlen=1000 ttimeoutlen=100

" map esc to jk
imap jk <esc>
"
" themes / colors
set term=xterm-256color
if !has("gui_running")
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif

set background=dark
colorscheme solarized

set numberwidth=3

hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Ignore files
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.ds_store,*/vendor,*/public,*/node_modules,*/bower_components

"Control P ignore files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|bower_components\|node_modules\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

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
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

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
au BufNewFile,BufRead,BufReadPost *.jade.html set filetype=jade

" Key Bindings
map <Leader>n :NERDTreeToggle<CR>

