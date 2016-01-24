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

Plugin 'VundleVim/Vundle.vim'

" ======================= PLUGINS =======================
 
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'benmills/vimux'
Plugin 'kristijanhusak/vim-hybrid-material'
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

if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif

call vundle#end()            " required
filetype plugin indent on

" ======================= COLOR =========================
set t_Co=256                                                                    "Set 256 colors

let g:enable_bold_font = 1

" ======================= AIRLINE =======================
" remember to install fonts powerline before using vim-airline

let g:Powerline_symbols = 'fancy'
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1									"Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' ' 								"Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '|'								"Right separator for tabline
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'                     "Set encoding type info
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline_powerline_fonts = 1												"Enable powerline fonts
let g:airline_theme = "wombat"													"Set theme to powerline default theme

syntax enable
set background=dark
colorscheme hybrid_material


" ======================= SETTINGS ======================

" set number and relativenumber
if exists("+relativenumber")
    set nonumber
    set relativenumber
else
    set number
endif

set tabstop=4
set autoindent                          " Make sure that unrecognized files are still indented
set showcmd                             " Show (partial) commands (or size of selection in Visual mode) in the status
set showmatch                           " When a bracket is inserted, briefly jump to a matching one
set enc=utf-8       					" Use UTF-8 as the default buffer encoding
set showtabline=2                       " Make sure that tabline is always present
set laststatus=2    					" Always show status line, even for one window
set mouse=""        					" Disable mouse
set expandtab      						" Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    					" Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   					" Indent by 4 spaces when pressing <TAB>
set autoindent      					" Keep indentation from previous line
set smartindent     					" Automatically inserts indentation in some cases
set exrc                                " Enable project specific .vimrc
set secure                              " Enable secure mode
set backupdir=/tmp
set directory=/tmp                      " Don't clutter my dirs up with swp and tmp files
set ruler                               " Show line, column number, and relative position within a file in the status
set scrolloff=999                       " Scroll when cursor gets within 10 characters of top/bottom edge
set shiftwidth=4                        " Use 4 spaces for (auto)indent
let mapleader = ","                     " Set the <Leader> for combo commands
hi normal ctermbg=NONE                  " Stuff for iTerm


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
    
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*/node_modules/*

" Do not change the current path
let g:ctrlp_working_path_mode = '0'

" Exclude vendor folder during search
:set wildignore+=**/vendor/**

" Create folder at current path
map <Leader>mk :mkdir %:h<CR><CR>

" Save
map <Leader>, :w<CR>
imap <Leader>, <ESC>:w<CR>
vmap <Leader>, <ESC><ESC>:w<CR>

" if you do not use plugins airline

" Statusline setup
set statusline =%#StatusLineFilename#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

" Read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" Modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines

" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
