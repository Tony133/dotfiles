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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'benmills/vimux'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'othree/html5.vim'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-markdown'
Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'prettier/vim-prettier'

if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif

" Required
call vundle#end()
filetype plugin indent on

" Set 256 colors
set t_Co=256
set term=xterm-256color

syntax enable
set background=dark
colorscheme onedark
set omnifunc=syntaxcomplete#Complete

" See 120 char line
set colorcolumn=120
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235

" ========================================== SETTINGS ==============================================

" set number and relativenumber
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
set expandtab

let mapleader = ","       " Set the <Leader> for combo commands

" Exit insert mode with jk
:inoremap jk <esc>

" column for git +, -
set signcolumn=yes

" open all folds
set foldmethod=indent
set foldlevelstart=99

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

" easy split resize
map + :vertical resize +5<cr>
map - :vertical resize -5<cr>
map = <c-w>=

" open a new vertical split
map <Leader>\| :vnew<cr>

" Use 2 space on specific files
autocmd Filetype sls,js,javascript,yaml,ruby,python setlocal ts=2 sts=2 sw=2

" Remove trailing spaces
au FileType vim,php,c,python,html,twig,yml,xml,js,javascript,md,sls au BufWritePre *.* :%s/\s\+$//e

" Ignore folders for ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](report|build|__pycache__|myvenv|_build|bin|cache|vendor|e2e|node_modules|dist|bower_components|_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pages|pdf)$',
    \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*/node_modules/*

" Plugin Prettier
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Clear File Cache
nmap <leader>cc :CtrlPClearCache<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>h :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>mv :!mv % <C-R>=expand("%:p:h") . '/'<CR>

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

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Tmux integration
let g:VimuxOrientation="h"
nmap <Leader>r :VimuxRunCommand ''<Left>
nmap <Leader>R :VimuxCloseRunner<CR>

" Syntastic json
let g:vim_json_syntax_conceal = 1

" Settings syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Syntastic check
let g:syntastic_html_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']


let g:javascript_plugin_jsdoc = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" PHP
au FileType php set omnifunc=phpcomplete#CompletePHP
" SASS
au BufNewFile,BufRead *.scss set filetype=scss
" LESS
au BufNewFile,BufRead *.less set filetype=less
" HTML
au BufRead,BufNewFile *.twig,*.blade.php set filetype=html
" MARKDOWN
au BufRead,BufNewFile *.md,*mdown set filetype=markdown
" DOCKERFILE
au BufRead,BufNewFile *.Dockerfile set filetype=dockerfile
" JAVASCRIPT
au BufRead,BufNewFile *.ts,*.vue set filetype=javascript

" Enable markdown preview
let g:instant_markdown_autostart = 1
let g:instant_markdown_slow = 1

" Open preview window
map <Leader>mdp :InstantMarkdownPreview<CR>

" Statusline setup

highlight StatusLine guibg=DarkGrey ctermfg=7 guifg=white
highlight StatusLineNC guibg=DarkGrey ctermfg=7 guifg=white

set statusline =%#StatusLineFilename#

" tail of the filename and edit
set statusline+=[%f]%m

" display if &paste is set
set statusline+=%{&paste?'\|\ [paste]':''}
set statusline+=%*

" read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" left/right separator
set statusline+=%=

" display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" FileType
set statusline+=%*%y\|

" Encoding & Fileformat
set statusline+=%*\ %{(&fenc!=''?&enc:&fenc)}\%{'['.&ff.']'}

" rownumber/total (%)
set statusline+=%*\|\ %3p%%\ \%l/%L:\ %3c


highlight Comment gui=italic cterm=italic
highlight htmlArg gui=italic cterm=italic

"Alias
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Wq","wq")
call SetupCommandAlias("WQ","wq")
call SetupCommandAlias("wQ","wq")
