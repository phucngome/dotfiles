function! LoadPlug()
    let plug_installed=filereadable(expand('~/.vim/autoload/plug.vim'))
    if plug_installed == 0
        echo "Installing Plug.."
        echo ""
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Plugin list
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'tomtom/tcomment_vim'
    Plug 'Raimondi/delimitMate'
    Plug 'mattn/emmet-vim'
    Plug 'fatih/vim-go'
    Plug 'elzr/vim-json'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Shougo/neocomplete.vim'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    Plug 'zhaocai/GoldenView.Vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    Plug 'uarun/vim-protobuf'
    Plug 'junegunn/vim-easy-align'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'Yggdroot/indentLine'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

    call plug#end()

    if plug_installed==0
        echo plug_installed
        echo "Plug Installed, now Installing Plugins..."
        echo ""
        :PlugInstall
    endif
endfunction
call LoadPlug()


set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf8
set number
set nowrap
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set nobackup
set nowritebackup
set noswapfile
set tags+=tags,.tags
set mouse=


let g:goldenview__enable_default_mapping = 0
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\var$', '\.vscode$', '^node_modules$', '^tags$']
let NERDTreeAutoDeleteBuffer                 = 1
let NERDTreeMinimalUI                        = 1
let NERDTreeDirArrows                        = 1
let NERDTreeShowHidden                       = 1
let g:webdevicons_enable                     = 1
let g:webdevicons_enable_nerdtree            = 1
let g:WebDevIconsOS                          = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes  = 1
let g:webdevicons_enable_airline_statusline  = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:DevIconsEnableFoldersOpenClose = 1

autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0
let g:neocomplete#enable_at_startup = 1
let g:user_emmet_install_global     = 1
let g:user_emmet_leader_key         = ','

autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:mustache_abbreviations = 1
" custom keymaps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
map <c-n> :NERDTreeToggle<CR>
map <cr> :TagbarToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
noremap <C-h> <C-W>h
map <C-l> <C-W>l
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>
map <leader>r <Esc>:GoRun<CR>
map <c-p> <Esc>:Files<CR>

syntax on
colorscheme nord
set fcs=vert:\|
set list listchars=tab:→\ ,trail:∙,nbsp:•

let mapleader = "\\"
let g:UltiSnipsExpandTrigger="<tab>"
let g:php_cs_fixer_rules = "@PSR2"
let g:fzf_layout = { 'up': '~40%' }
let g:go_list_type                    = "quickfix"
let g:go_def_mode                     = 'gopls'
let g:go_info_mode                    = 'gopls'
let g:go_metalinter_autosave_enabled  = ['staticcheck']
let g:go_fmt_command                  = "goimports"
let g:go_auto_type_info               = 1
let g:vim_json_syntax_conceal         = 0
let g:airline_powerline_fonts         = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:user_emmet_install_global=0
let g:pymode_python = 'python3'

let g:ale_linters = {
\   'html': [''],
\   'php': [''],
\}
"
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends': 'jsx',
\  },
\}

augroup autoformat_settings
  autocmd FileType javascript,typescript,html,css,scss,json AutoFormatBuffer prettier
  autocmd BufRead,BufNewFile *.blade.php set filetype=html
  autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
  autocmd FileType html,css,javascript,javascript.jsx EmmetInstall
augroup END


