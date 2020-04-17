set nocompatible
function! LoadPlug()
    let plug_installed=filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    if plug_installed == 0
        echo "Installing Plug..."
        echo ""
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif

    " Plugin list
    call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'tomtom/tcomment_vim'
    Plug 'Raimondi/delimitMate'
    Plug 'mattn/emmet-vim'
    Plug 'elzr/vim-json'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'zhaocai/GoldenView.Vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'uarun/vim-protobuf'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'pangloss/vim-javascript'
    Plug 'Yggdroot/indentLine'
    Plug 'hashivim/vim-terraform'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'jparise/vim-graphql'
    Plug 'leafgarland/typescript-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set cmdheight=2
set shortmess+=c
colorscheme nord
set list listchars=tab:→\ ,trail:∙,nbsp:•
autocmd FileType html,css,javascript,jsx,vue EmmetInstall
autocmd FileType css,html,javascript,vue,yaml,typescript,typescriptreact,scss setlocal shiftwidth=2 softtabstop=2 expandtab


let g:goldenview__enable_default_mapping    = 0
let NERDTreeIgnore                          = ['\.git$', '\.DS_Store$', '^var$', '\.vscode$', '^node_modules$', '^tags$', '^tags.lock$', '^__pycache__$']
let NERDTreeAutoDeleteBuffer                = 1
let NERDTreeMinimalUI                       = 1
let NERDTreeShowHidden                      = 1
let g:webdevicons_enable_nerdtree           = 1
let g:webdevicons_enable_airline_statusline = 1
let g:DevIconsEnableFoldersOpenClose        = 1
let g:user_emmet_install_global             = 1
let g:vim_json_syntax_conceal               = 0
let g:airline_powerline_fonts               = 1
let g:user_emmet_settings                   = {'javascript' : {'extends': 'jsx'}}
let g:user_emmet_leader_key                 = ','
let g:airline#extensions#ale#enabled        = 1
let g:terraform_align                       = 1
let g:terraform_fmt_on_save                 = 1


" Config coc.vim
" CocInstall coc-tsserver coc-json coc-html coc-css coc-go coc-yaml coc-snippets coc-phpls
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" custom key map
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <c-n> :NERDTreeToggle<CR>
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>
map <c-f> <Esc>:Files<CR>
map <c-g> <Esc>:Rg<CR>
map ga <Plug>(EasyAlign)
nmap <silent> <c-]> <Plug>(coc-definition)

