call plug#begin('~/.vim/plugins')
" Vim Enhancements
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree',    { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
"Plug 'Valloric/YouCompleteMe', { 'do': '~/.vim/plugins/YouCompleteMe/install.py --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/BufOnly.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'

" Syntax, Language and Framework Support
Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'
Plug 'ternjs/tern_for_vim'
Plug 'ingydotnet/yaml-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'groenewege/vim-less', { 'for': ['less', 'scss'] }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'keith/swift.vim'
Plug 'ElmCast/elm-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'dylon/vim-antlr'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi' | Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/vim-js-pretty-template'
call plug#end()

" no need for compat with vi
set nocompatible

" syntax highlighting
syntax on

set background=dark

" color scheme
colorscheme solarized

" don't wrap in insert mode
" set formatoptions-=t

" set default buffer to the clipboard
set clipboard=unnamed

" use ack for grep searching (the k option says only search files that ack knows
" about)
set grepprg=ack

" set tag file location
set tags=./tags,./.tags;

" reuse same window and switch from unssaved buffer
set hidden

" better command line completion
set wildmenu

" show partial commands in last line of screen
set showcmd

" highlight searches
set nohlsearch

" ignore case on searches
set ignorecase

" ignore case on searches except when using capital letters
set smartcase

" stop certain movements from going to first character of line
set nostartofline

" display curosr position on last line of screen
set ruler

" always display the status line even if only one window is displayed
set laststatus=2

" ask to save unsaved changes instead of error
set confirm

" don't beep
set visualbell
set noerrorbells

" enable use of mouse for all modes
set mouse=a

set ttyfast

set ttymouse=xterm2

" set command window height to 2 lines
set cmdheight=2

" display line numbers on left
set number

" quickly timeout on keycodes but never on mappings
set notimeout ttimeout ttimeoutlen=200

" use <f11> to toggle paste and nopaste
set pastetoggle=<f8>

" shell to use
set sh=/bin/zsh

" backup directory
set backupdir=~/.vim_backup//

" swp directory
set directory=~/.vim_swp//

" 1 space for joined lines instead of 2
set nojoinspaces

" set color bar at 120px
set colorcolumn=120

" don't autowrap
set nowrap

" text width
set textwidth=80

" 2 spaces for a shift
set shiftwidth=2

" 2 spaces for a tab
set softtabstop=2

" expand tabs to spaces
set expandtab

" set indent based on file type
filetype indent plugin on

" auto set the indent based on previous line
set autoindent

" number of context lines above and below the cursor
set scrolloff=1

" set the term title
set title

" show whitespace characters
set list

" don't give ins-completion-menu messages
set shortmess+=c

" highlight current column
"set cursorcolumn

" highlight current line
"set cursorline

" map regular keys for dvorak mode
" set langmap=jh,kt

let mapleader = ','

" exit insert mode
imap jk <esc>

" write file insert mode
imap <leader>w <esc> :w<cr>

" write file normal mode
nmap <leader>w :w<cr>

" quit window
nmap <leader>q :q<cr>

" install plugins
nmap <leader>i :PlugInstall<cr>

" split windows
nmap <leader>s :sp<cr><c-w><c-w>
nmap <leader>v :vsp<cr><c-w><c-w>

" smart way to move between windows
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" switch buffers
nmap <leader>b :bp<cr>

" new line and insert cursor between brackets
imap <leader>s <cr><esc>O

" go to definition using ctags
nmap <leader>g <c-]>

" edit snippets for current file type
map <c-e> :UltiSnipsEdit<cr>

" toggle nerdtree
map <leader><tab> :NERDTreeToggle<cr>

" toggle tagbar
map <leader>t :TagbarToggle<cr>

" toggle ctrlp
map <leader>f <C-p>

" move quickly
imap <c-d> <c-[>diwi

" search visually selected text
vnoremap // y/<c-r>"<cr>

" COMMANDS

" Automatically reload vimrc file on edit
augroup myvimrc
au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" automatically open quickfix window on grep searches
autocmd QuickFixCmdPost *grep* cwindow
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType crontab set nobackup nowritebackup

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar AGrep silent! grep! <args>|cwindow|redraw!
nnoremap \ :AGrep<space>

" use antlr4 syntax highlighting for g4 files
au BufRead,BufNewFile *.g4 set filetype=antlr4

" use JsPreTmpl and html filetypes for typescript
" autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" this is required for vim-textobj-rubyblock
runtime macros/matchit.vim

" PLUGIN SETTINGS

" Plugin: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_debug = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:syntastic_html_checkers = []
let g:syntastic_lex_checkers = []
let g:syntastic_yacc_checkers = []

" Plugin: NERDTree
let NERDTreeStatusline= "%{ getcwd() }"

" Plugin: YouCompleteMe
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Plugin: supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Plugin: UltiSnips
let g:UltiSnipsEditSplit               = "horizontal"
let g:UltiSnipsSnippetsDir             = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger           = "<tab>"
let g:UltiSnipsJumpForwardTrigger      = "<tab>"
let g:UltiSnipsJumpBackwardTrigger     = "<s-tab>""

" Plugin: CtrlP
let g:ctrlp_working_path_mode='r'
let g:ctrlp_custom_ignore = 'dist\|/node_modules\|build\|.git\'
let g:ctrlp_show_hidden = 1

" Plugin: vim-tags
let g:vim_tags_auto_generate = 1
let g:vim_tags_project_tags_command = "{CTAGS} -R --exclude=.git --exclude=node_modules --exclude=_dev {DIRECTORY}"

" Plugin: nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Plugin: scratch.vim
let g:scratch_persistence_file = '~/.vim/scratch.txt'

" Plugin: airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
" let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Plugin: BufOnly

" close the current buffer but keep the window
nmap <silent> <leader>x :bp\|bd #<cr>

" close all buffers including the current one
nmap <silent> <leader><s-x> :BufOnly<cr>

" Plugin: vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit -v -q<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gt :Gcommit -v -q %<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr><CR>
nnoremap <leader>gl :silent! Glog<cr>
nnoremap <leader>gp :Ggrep<space>
nnoremap <leader>gm :Gmove<space>
nnoremap <leader>gb :Git branch<space>
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>gps :Dispatch! git push<cr>
nnoremap <leader>gpl :Dispatch! git pull<cr>

" Plugin: vim-easy-align
" start interactive EasyAlign in visual mode (e.g. vip,a)
xmap ga <Plug>(EasyAlign)

" quickly align import { X } from './some/path' on the 'from' token.
xmap <leader>f :EasyAlign /from/<cr>

" Plugin: Quramy/tsuquyomi
" typescript ide features
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript nmap <buffer> <leader>h : <c-u>echo tsuquyomi#hint()<cr>

" Plugin: leafgarland/typescript-vim
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Plugin: ntpeters/vim-better-whitespace
let g:better_whitespace_enabled = 0

" Plugin: jiangmiao/auto-pairs
let g:AutoPairsShortcutBackInsert = '<c-b>'

" Plugin: mxw/vim-jsx
" let g:jsx_ext_required = 0
