syntax on
filetype plugin indent on

if has("multi_lang")
  language C
endif

set runtimepath+=$HOME/.config/vim,$HOME/.config/vim/after
set wildignore+=log/**,tmp/**,target/**,dist/**,.bundle/**,.git/**,node_modules/**
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set nocompatible
set cwh=1
set visualbell t_vb=
set nobackup
set noswapfile
set noerrorbells
set autoread
set hidden
set virtualedit=onemore
set backspace=indent,eol,start
set breakindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set hlsearch
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set ignorecase
set pumheight=10
set foldlevel=200
set clipboard+=unnamed
set laststatus=2
set statusline=%f%m%=\ %{&fenc!=''?&fenc:&enc}
set display=lastline

autocmd FileType netrw setl bufhidden=delete
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:python3_host_prog = expand('/usr/local/bin/python3')
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
let g:go_fmt_command = "goimports"
let g:go_gocode_unimported_packages = 1
let dart_format_on_save = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let mapleader = "\<Space>"
let loaded_matchparen = 1

nnoremap <C-n> :bn<cr>
nnoremap <C-p> :bp<cr>
nnoremap == gg=VG
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap <silent>rr :RustRun<cr>
nnoremap <silent>rt :Ctest -- --nocapture<cr>
nnoremap <silent>j gj
nnoremap <silent>k gk
nnoremap <Leader>f :Ex<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>d :bw!<CR>
nnoremap <Leader>w :Gwrite<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader><Leader> :Denite file_rec<CR>
" nnoremap <Leader><Leader> :vim  **<left><left><left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-g> <Left>
vmap <silent> <expr> p <sid>Repl()

function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

function! s:remove_line_in_last_line()
    if getline('$') == ""
        $delete _
    endif
endfunction

augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


call plug#begin('~/.config/vim/plugins')
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'dart-lang/dart-vim-plugin'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/denite.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [ '.git/', 'build/', '__pycache__/', 'images/', '*.o', '*.make', '*.min.*', 'img/', 'fonts/', 'node_modules/'])

command! SC echo synIDattr(synID(line("."), col("."), 1), "name")
hi Comment           guifg=darkgray guibg=black guisp=NONE gui=NONE ctermfg=darkgray ctermbg=black cterm=NONE
hi SpecialKey        guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi StatusLine        guifg=black guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi StatusLineTerm    guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi StatusLineTermNC  guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi StatusLineNC      guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi VertSplit         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=black ctermbg=black cterm=NONE
hi NonText           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi MoreMsg           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi LineNr            guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi CursorLineNr      guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Title             guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Question          guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Constant          guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi String            guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Character         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Number            guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Boolean           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Float             guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Identifier        guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Function          guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Statement         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Conditional       guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Repeat            guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Label             guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Operator          guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Keyword           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Exception         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi PreProc           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Include           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Define            guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Macro             guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi PreCondit         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Type              guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi StorageClass      guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Structure         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Typedef           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Special           guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi SpecialChar       guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Tag               guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Delimiter         guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi SpecialComment    guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Debug guifg=white guibg=black guisp=NONE  guisp=NONE ctermfg=white ctermbg=black cterm=NONE
hi Underlined        guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi Ignore            guifg=red   guibg=black guisp=NONE gui=NONE ctermfg=darkred ctermbg=black cterm=NONE
hi Error             guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi netrwDir          guifg=black guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi EndOfBuffer       guifg=black guibg=black guisp=NONE gui=NONE ctermfg=black ctermbg=black cterm=NONE
hi CursorLine        guifg=white guibg=black guisp=NONE gui=NONE ctermfg=white ctermbg=black cterm=NONE
hi netrwTreeBar      guifg=black guibg=black guisp=NONE gui=NONE ctermfg=black ctermbg=black cterm=NONE
hi IncSearch         guifg=black guibg=white guisp=NONE gui=NONE ctermfg=126 ctermbg=black cterm=NONE
hi Search            guifg=black guibg=white guisp=NONE gui=NONE ctermfg=126 ctermbg=black cterm=NONE
hi Visual            guifg=black guibg=white guisp=NONE gui=NONE ctermfg=black ctermbg=white cterm=NONE

