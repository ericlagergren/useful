" Set basic encoding.
set encoding=utf-8
scriptencoding utf-8

execute pathogen#infect()
execute pathogen#helptags()

" Loading settings
filetype off
syntax on
syntax sync minlines=100
filetype plugin indent on

" Mappings
inoremap :+ :=
inoremap 1= !=

let mapleader = "\<space>"

nnoremap <Leader>w :w<CR>

nnoremap <silent> <A-Right> <c-w>l
nnoremap <silent> <A-Left> <c-w>h
nnoremap <silent> <A-Up> <c-w>k
nnoremap <silent> <A-Down> <c-w>j

set backspace=indent,eol,start
set breakindent
set cmdheight=2
set cursorline
set expandtab
set fileencoding=utf-8
set fileformats=unix,dos,mac
set history=9999
set hlsearch
set ignorecase
set incsearch
set infercase
set linebreak
set linespace=0
set noexpandtab
set nowrap
set number
set numberwidth=3
set pastetoggle=<F10>
set report=0
set scrolljump=5
set scrolloff=5
set secure
set shiftround " tab at 3 spaces means 4 spaces, not 7
set shiftwidth=4
set showcmd
set tabstop=4 " real tabs are 8 chars
set tags=./.tags,tags;
set ttimeoutlen=10
set ttimeout
set ttyfast " ???

" Clipboard
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/temp/
set undodir=~/.vim/undo/
set undofile " persistent undo
set undolevels=1000 " persistent undo
set undoreload=10000 " to undo forced reload with :e

" vim conceal
set conceallevel=2
let g:tex_conceal="abdgm"

" cd to dir
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" Formatting

autocmd BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
autocmd FileType terraform setlocal commentstring=#%s

" Cypher commentary plugin
autocmd FileType cql setlocal commentstring=//\ %s

set viminfo=!,h,'500,<10000,s1000,/1000,:1000
" Include uppercase registers
" Disable hlsearch while loading viminfo
" Remember marks for last 500 files
" remember up to 10000 lines in each register
" remember up to 1MB in each register
" remember last 1000 search patterns remember last 1000 commands

set formatoptions=qrn1j
" Allow gq to work on comment
" enter extends comments
" format numbered lists using 'formatlistpat'
" don't break after one letter work
" remove comment when joining lines

set statusline=[%{getcwd()}][%f]%=%r%y[%P][col:%c]%{gutentags#statusline('[Generating\ Tags...]')}%{fugitive#statusline()}

" Mice!
set mouse=a " use mouse
set nomousehide " don't hide the mouse
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
endif

" ruler!
if exists("+colorcolumn")
	set textwidth=80
	set colorcolumn=+1
else
	au BufWinEnter * let w:m2=matchadd("ErrorMsg", "\%>80v.\+", -1)
endif

if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" autopairs
let g:AutoPairsFlyMode = 0

" Vim-go
let g:go_def_mode = "godef"
let g:go_guru_tags = "protobuf"
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

set updatetime=100
set autowrite

map <C-n> :cnext<CR> " ctrl+n for next error
map <C-m> :cprevious<CR> " ctrl+m for prev
nnoremap <leader>a :cclose<CR> " close bo with leder+a

autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:nofrils_strbackgrounds=1   " turn on highlighted string backgrounds
let g:nofrils_heavycomments=0    " bright comments off
let g:nofrils_heavylinenumbers=0 " heavy line numbers off
colo nofrils-dark

function! CopyMatches(reg)
	let hits = []
	%s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
	let reg = empty(a:reg) ? '+' : a:reg
	execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
