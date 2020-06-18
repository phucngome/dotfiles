set nocompatible
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
    Plug 'elzr/vim-json'
    Plug 'ervandew/supertab'
    Plug 'zhaocai/GoldenView.Vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'uarun/vim-protobuf'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'Yggdroot/indentLine'
    Plug 'hashivim/vim-terraform'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'jparise/vim-graphql'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'phucngodev/vim-mono'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'stephpy/vim-php-cs-fixer'
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

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
set encoding=UTF-8
set number
set relativenumber
set hidden
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
set completeopt-=preview
set signcolumn=no
colorscheme mono

autocmd FileType html,css,javascript,jsx,vue,typescriptreact,php EmmetInstall
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
autocmd BufWritePre *.php silent! call PhpCsFixerFixFile()
autocmd BufWritePre *.go silent! :call LanguageClient#textDocument_formatting_sync()

let NERDTreeIgnore                          = ['\.git$', '\.DS_Store$', '^var$', '\.vscode$', '^node_modules$', '^tags.temp$', '^tags$', '^tags.lock$', '^__pycache__$']
let NERDTreeAutoDeleteBuffer                = 1
let NERDTreeMinimalUI                       = 1
let NERDTreeShowHidden                      = 1
let g:webdevicons_enable                    = 1
let g:WebDevIconsOS                         = 'Darwin'
let g:webdevicons_enable_nerdtree           = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline_powerline_fonts               = 1
let g:airline_theme                         ='base16_grayscale'
let g:user_emmet_install_global             = 1
let g:user_emmet_install_global             = 0
let g:user_emmet_settings                   = {'javascript' : {'extends': 'jsx'}}
let g:user_emmet_leader_key                 = ','
let g:terraform_align                       = 1
let g:terraform_fmt_on_save                 = 1
let g:UltiSnipsExpandTrigger                = "<tab>"
let g:fzf_layout                            = { 'up': '~30%' }
let g:deoplete#enable_at_startup            = 1
let g:goldenview__enable_default_mapping    = 0
let g:vim_json_syntax_conceal               = 0


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
map <c-b> <Esc>:Buffers<CR>
map <c-g> <Esc>:Rg<CR>
map <c-]> <Esc>:call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Config language server client
let g:LanguageClient_serverCommands = {
\ 'go': ['gopls'],
\ 'php': ['phpactor', 'language-server'],
\ 'javascript': ['javascript-typescript-stdio'],
\ }

