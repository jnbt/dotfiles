set nocompatible

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype on
filetype indent on
filetype plugin on

" Add line numbers
set number
set ruler

" Set color theme
set background=dark
colorscheme solarized

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show trailing spaces and highlight hard tabs
set list listchars=tab:»\ ,trail:·,extends:<,precedes:>,eol:¬,nbsp:·
highlight NonText ctermfg=0 ctermbg=NONE guifg=#073642 guibg=NONE
highlight SpecialKey ctermfg=0 ctermbg=NONE guifg=#073642 guibg=NONE

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin using a highlight group
highlight OverLength cterm=NONE,undercurl ctermbg=0 gui=NONE,undercurl guibg=#073642 guisp=#dc322f
match OverLength /\%>80v.\+/

" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" ctrp custom ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.eunit$',
  \ 'file': '\.exe$\|\.so$\|\.dll\|\.beam$\|\.DS_Store$'
  \ }

" Show filename in iTerm Title
set t_ts=^[]1;
set t_fs=^G
