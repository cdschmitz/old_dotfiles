if v:version > 700
    execute pathogen#infect()
endif

filetype plugin indent on
filetype indent on
syntax on
set number
set history=150
set backspace=indent,eol,start
set showcmd
set ruler
set scrolloff=5
set tabstop=4
set shiftwidth=4
set expandtab
set nohlsearch
set visualbell
set t_vb=

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

command DW %s/\s\+$//g
command MD5 .!md5 -q %
command SHA .!shasum -a 256 %

nore ; :
nore : ;
ca qi qa!
vnoremap v <Esc>^v$h
vnoremap <silent> <space> zf
nnoremap Q <nop>
nnoremap <silent> <space> za
inoremap jf <Esc>

" Window movement
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" MiniBufExpl
nnoremap <silent> <Tab> :MBEbn<CR>
nnoremap <silent> <S-Tab> :MBEbp<CR>

" Javascript shortcuts
autocmd FileType html,javascript inoremap cslg console.log();<Esc>hi
autocmd FileType html,javascript inoremap db; debugger;

" Code folding
" autocmd BufWrite *.* mkview
" autocmd BufRead *.* silent loadview

" Python
au BufRead,BufNewFile *.py,*pyw set nosmartindent
" au BufRead,BufNewFile *.py,*.pyw set tabstop=4
" autocmd FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" autocmd FileType python match OverLength /\%>79v.\+/
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Mustache abbreviations
let g:mustache_abbreviations = 1
let g:vim_json_syntax_concealcursor = 0

" Syntastic
command SR SyntasticReset
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive"}
