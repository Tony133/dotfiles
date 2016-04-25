set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8            " Enconding utf-8

"Install vundle
let shouldInstallBundles = 0
if !filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
    echo "~≥ Installing Vundle \n"
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle $HOME/.vim/bundle/Vundle.vim
    silent !mkdir -p $HOME/.tmp
    let shouldInstallBundles = 1
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ======================= PLUGINS =======================

Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'benmills/vimux'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'burnettk/vim-angular'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Yggdroot/indentLine'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'

if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif

" required
call vundle#end()
filetype plugin indent on

" ======================= COLOR =========================
set t_Co=256                                                                    "Set 256 colors
set term=xterm-256color

let g:enable_bold_font = 1

syntax enable
set background=dark
colorscheme hybrid_material

" ======================= AIRLINE =======================
" Remember to install fonts powerline before using vim-airline

let g:Powerline_symbols = 'fancy'
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 0									"Disable tabline extension
let g:airline#extensions#tabline#left_sep = ' ' 								"Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '|'								"Right separator for tabline
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                     "Set encoding type info
let g:airline_powerline_fonts = 1												"Enable powerline fonts
let g:airline_theme = "wombat"
let g:airline#extensions#tabline#buffer_min_count = 1

" ======================= SETTINGS ======================

" Set number and relativenumber
if exists("+relativenumber")
    " Due to a problem with relative line numbers not persisting across new
    " tabs and splits, set no line numbers at all...
    set nonumber
    " ..then set relative ones.
    set relativenumber
" ...otherwise let’s just have regular ones.
else
    set number
endif

" Allow backspacing over everything
set backspace=indent,eol,start

set tabstop=4             " Use 4 spaces for <Tab> and :retab
set cursorline            " Highlight current line - allows you to track cursor position more easily
set completeopt=menuone   " Insert mode completion options
set infercase             " Allow smarter completion by infering the case
set autoindent            " Make sure that unrecognized files are still indented
set showcmd               " Show (partial) commands (or size of selection in Visual mode) in the status
set showmatch             " When a bracket is inserted, briefly jump to a matching one
set enc=utf-8       	  " Use UTF-8 as the default buffer encoding
set showtabline=1         " Make sure that tabline is always present
set laststatus=2    	  " Always show status line, even for one window
set mouse=""        	  " Disable mouse
set expandtab      		  " Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    	  " Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   	  " Indent by 4 spaces when pressing <TAB>
set autoindent      	  " Keep indentation from previous line
set smartindent     	  " Automatically inserts indentation in some cases
set exrc                  " Enable project specific .vimrc
set secure                " Enable secure mode
set backupdir=/tmp
set directory=/tmp        " Don't clutter my dirs up with swp and tmp files
set ruler                 " Show line, column number, and relative position within a file in the status
set scrolloff=999         " Scroll when cursor gets within 10 characters of top/bottom edge

let mapleader = ","       " Set the <Leader> for combo commands

hi normal ctermbg=NONE    " Stuff for iTerm

" MINIBUFFER 
" close buffer explorer on select
let g:miniBufExplAutoStart = 0
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplVSplit = 35

" Exit insert mode with jk
:inoremap jk <esc>

" Save changes
map <Leader>s :w<CR>
imap <Leader>s <ESC>:w<CR>
vmap <Leader>s <ESC><ESC>:w<CR>

" Plugin IndetLine
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

let g:gitgutter_sign_column_always = 1

" Unmap arrow keys (vim hardcore mode)
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>h :split <C-R>=expand("%:p:h") . '/'<CR>

" easy split resize
map + :vertical resize +5<cr>
map - :vertical resize -5<cr>
map = <c-w>=

" open a new vertical split
map <Leader>\| :vnew<cr>

" Remove trailing spaces
au FileType vim,php,c,python,html,twig,yml,xml,js,md,sls au BufWritePre *.* :%s/\s\+$//e

" Ignore folders for ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](report|build|_build|bin|cache|vendor|node_modules|dist|bower_components|_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \ }

" Clear File Cache
nmap <leader>cc :CtrlPClearCache<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>h :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>mv :!mv % <C-R>=expand("%:p:h") . '/'<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*/node_modules/*

" Do not change the current path
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_match_window = 'max:30'

" Exclude vendor folder during search
:set wildignore+=**/vendor/**

" Create folder at current path
map <Leader>mk :mkdir %:h<CR><CR>

" Save
map <Leader>, :w<CR>
imap <Leader>, <ESC>:w<CR>
vmap <Leader>, <ESC><ESC>:w<CR>

" Tmux integration
let g:VimuxOrientation="h"
nmap <Leader>r :VimuxRunCommand ''<Left>
nmap <Leader>R :VimuxCloseRunner<CR>

" Json syntax
let g:vim_json_syntax_conceal = 1

" MARKDOWN
au BufRead,BufNewFile *.md,*mdown set filetype=markdown

" Update the display in realtime
let g:instant_markdown_slow = 1

" Disable markdown preview
let g:instant_markdown_autostart = 0

" Open preview window
map <Leader>mdp :InstantMarkdownPreview<CR>

" If you do not use plugins airline

"statusline setup
set statusline =%#StatusLineFilename#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

