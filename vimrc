set nocompatible               " be iMproved
filetype off                   " required!

" ---------------------------
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rizzatti/dash.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
Plugin 'sjl/gundo.vim'
Plugin 'sentientmachine/Pretty-Vim-Python'
Plugin 'pangloss/vim-javascript'
Plugin 'duskhacker/sweet-rspec-vim'
Plugin 'heartsentwined/vim-emblem'
Plugin 'sukima/xmledit'
Plugin 'isRuslan/vim-es6'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'

call vundle#end()

call vundle#end()

let g:vim_json_syntax_conceal = 0
nnoremap <F5> :GundoToggle<CR>

map <leader>R :SweetVimRspecRunFile<CR>
map <leader>r :SweetVimRspecRunFocused<CR>

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>

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
inoremap jj <ESC>
inoremap jk <ESC>
imap jk <ESC>
imap kj <ESC>

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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.ds_store,*/vendor,*/public,*/node_modules,*/bower_components

"Control P ignore files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|bower_components\|node_modules\|data\|log\|tmp$|\build',
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

" Spell check for md files
set spelllang=en_us
autocmd FileType mail setlocal spell
autocmd BufRead COMMIT_EDITMSG setlocal spell
autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setlocal spell

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

noremap P "0P

" Control P
let g:ctrlp_working_path_mode = 0

