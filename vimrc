function! LoadPlug()
    let plug_installed=filereadable(expand('~/.vim/autoload/plug.vim'))
    if plug_installed == 0
        echo "Installing Plug..."
        echo ""
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Plugin list
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'tomtom/tcomment_vim'
    Plug 'Raimondi/delimitMate'
    Plug 'mattn/emmet-vim'
    Plug 'fatih/vim-go'
    Plug 'elzr/vim-json'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'Shougo/neocomplete.vim'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    Plug 'zhaocai/GoldenView.Vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'uarun/vim-protobuf'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'pangloss/vim-javascript'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'Yggdroot/indentLine'
    Plug 'posva/vim-vue'
    Plug 'hashivim/vim-terraform'

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
set mouse=a
colorscheme nord
set list listchars=tab:→\ ,trail:∙,nbsp:•
autocmd FileType css,html,javascript,vue setlocal shiftwidth=2 softtabstop=2 expandtab


let g:goldenview__enable_default_mapping    = 0
let NERDTreeIgnore                          = ['\.git$', '\.DS_Store$', '\var$', '\.vscode$', '^node_modules$', '^tags$']
let NERDTreeAutoDeleteBuffer                = 1
let NERDTreeMinimalUI                       = 1
let NERDTreeShowHidden                      = 1
let g:webdevicons_enable_nerdtree           = 1
let g:webdevicons_enable_airline_statusline = 1
let g:DevIconsEnableFoldersOpenClose        = 1
let g:neocomplete#enable_at_startup         = 1
let g:user_emmet_install_global             = 1
let g:vim_json_syntax_conceal               = 0
let g:airline_powerline_fonts               = 1
let g:go_auto_type_info                     = 1
let g:user_emmet_install_global             = 0
let g:go_list_type                          = "quickfix"
let g:go_fmt_command                        = "goimports"
let g:user_emmet_settings                   = {'javascript' : {'extends': 'jsx'}}
let g:user_emmet_leader_key                 =','
let g:ale_linters                           = {'html': [''], 'go': ['staticcheck']}
let g:ale_sign_error                        = '✘'
let g:ale_sign_warning                      = '⚠'
let g:ale_echo_msg_error_str                = 'E'
let g:ale_echo_msg_warning_str              = 'W'
let g:ale_echo_msg_format                   = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled        = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
autocmd FileType html,css,javascript,jsx,vue EmmetInstall
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" custom key map
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <c-n> :NERDTreeToggle<CR>
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>
map <c-p> <Esc>:Files<CR>

