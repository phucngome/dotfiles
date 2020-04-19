set nocompatible
function! LoadPlug()
    let plug_installed=filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    if plug_installed == 0
        echo "Installing Plug..."
        echo ""
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Plugin list
    call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'tomtom/tcomment_vim'
    Plug 'Raimondi/delimitMate'
    Plug 'mattn/emmet-vim'
    Plug 'elzr/vim-json'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'w0rp/ale'
    Plug 'ervandew/supertab'
    Plug 'zhaocai/GoldenView.Vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'uarun/vim-protobuf'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'posva/vim-vue'
    Plug 'hashivim/vim-terraform'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'jparise/vim-graphql'
    Plug 'phucngodev/molokai'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }


    call plug#end()

    if plug_installed==0
        echo plug_installed
        echo "Plug Installed, now Installing Plugins..."
        echo ""
        :PlugInstall
    endif
endfunction
call LoadPlug()


filetype plugin indent on
syntax enable
set encoding=utf8
set number
set relativenumber
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
set list listchars=tab:→\ ,trail:∙,nbsp:•
set t_Co=256
colorscheme molokai

autocmd FileType html,css,javascript,jsx,vue EmmetInstall
autocmd FileType css,html,javascript,vue,yaml setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync

let g:prettier#autoformat                   = 0
let g:prettier#config#single_quote          = 'false'
let g:prettier#config#trailing_comma        = 'all'
let g:goldenview__enable_default_mapping    = 0
let NERDTreeIgnore                          = ['\.git$', '\.DS_Store$', '^var$', '\.vscode$', '^node_modules$', '^tags.temp$', '^tags$', '^tags.lock$', '^__pycache__$']
let NERDTreeAutoDeleteBuffer                = 1
let NERDTreeMinimalUI                       = 1
let NERDTreeShowHidden                      = 1
let g:webdevicons_enable_nerdtree           = 1
let g:webdevicons_enable_airline_statusline = 1
let g:DevIconsEnableFoldersOpenClose        = 1
let g:user_emmet_install_global             = 1
let g:vim_json_syntax_conceal               = 0
let g:airline_powerline_fonts               = 1
let g:airline#extensions#ale#enabled        = 1
let g:airline#extensions#tabline#enabled    = 1
let g:user_emmet_install_global             = 0
let g:user_emmet_settings                   = {'javascript' : {'extends': 'jsx'}}
let g:user_emmet_leader_key                 = ','
let g:ale_linters                           = {'html': [''], 'javascript': ['eslint'], 'vue': ['eslint']}
let g:ale_fixers                            = {'javascript': ['eslint'], 'vue': ['eslint']}
let g:ale_sign_error                        = '✘'
let g:ale_sign_warning                      = '⚠'
let g:ale_echo_msg_error_str                = 'E'
let g:ale_echo_msg_warning_str              = 'W'
let g:ale_echo_msg_format                   = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save                      = 1
let g:ale_fix_on_save                       = 1
let g:terraform_align                       = 1
let g:terraform_fmt_on_save                 = 1
let g:UltiSnipsExpandTrigger                = "<tab>"
let g:fzf_layout                            = { 'up': '~30%' }


let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()


" custom key map
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <c-n> :NERDTreeToggle<CR>
map ga <Plug>(EasyAlign)
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>
map <c-f> <Esc>:Files<CR>
map <c-t> <Esc>:Buffers<CR>
map <c-g> <Esc>:Rg<CR>
map <c-m> :call LanguageClient_contextMenu()<CR>
map <c-k> :call LanguageClient#textDocument_hover()<CR>
map <c-]> :call LanguageClient#textDocument_definition()<CR>
map <c-i> :call LanguageClient#textDocument_codeAction()<CR>

