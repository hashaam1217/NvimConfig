" vim:foldmethod=marker:foldlevel=0
" zo + zc to open / close folds

" PLUG {{{
call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tomtom/tcomment_vim' " gc comments
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"Old
Plug 'mg979/vim-visual-multi'
Plug 'morhetz/gruvbox'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'jiangmiao/auto-pairs'
Plug 'mxw/vim-jsx'
Plug 'hadolint/hadolint'
Plug 'ixru/nvim-markdown'
"Plug 'itchyny/lightline.vim'
"Plug 'github/copilot.vim'

"Markdown
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tree-sitter-grammars/tree-sitter-markdown'
"Plug 'tadmccorkle/markdown.nvim'

"SystemVerilog Plugins
Plug 'wbthomason/packer.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'https://codeberg.org/Guilty/VerilogImproved'

"telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'

" FZF / Ctrlp for file navigation
if executable('fzf')
  " OSX vs Linux loading (depending on where fzf is)
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Darwin"
    Plug '/usr/local/opt/fzf'
  else
    Plug 'junegunn/fzf', {'dir': '~/.local/src/fzf', 'do': './install --all' }
  endif
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

call plug#end()

"lua require('markdown').setup()
" }}}
" LOOK AND SYNTAX HILIGHTING {{{
set t_Co=256
syntax on
highlight Normal ctermbg=233
colorscheme nnkd

" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Undefined Marks
highlight UndefinedMarks ctermfg=yellow
autocmd Syntax * syn match UndefinedMarks /???/ containedin=ALL

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo
au BufRead,BufNewFile *.pp            set filetype=puppet

" Better split character
" Override color scheme to make split them black
" set fillchars=vert:\|
set fillchars=vert:│

set colorcolumn=101
set cursorline

"My changes
highlight LineNr ctermfg=grey
highlight CursorLineNr cterm=bold


" }}}
" KEYMAPPINGS {{{
" Leader key
let mapleader = ","

" arrow keys disable
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <up> <nop>

vnoremap <right> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <up> <nop>

" j/k move virtual lines, gj/jk move physical lines
" noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
" noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Remap increment and decrement numbers to something that works on macs/linux
" nnoremap <A-a> <C-a>
" nnoremap <A-x> <C-x>

" panes
nnoremap <leader>d :vsp<cr>
set splitright
nnoremap <leader>s :split<cr>
set splitbelow
" map <C-w>w (switch buffer focus) to something nicer
nnoremap <leader>w <C-w>w

" tabs
nnoremap <leader>] :tabn<cr>
nnoremap <leader>[ :tabp<cr>
nnoremap <leader>T :tabe<cr>

" Insert date
nnoremap <leader>fd "=strftime("%m-%d-%y")<CR>p

" Edit vimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>evs :source $MYVIMRC<cr>

" Toggle paste with F2
set pastetoggle=<F2>

" Terminal Mode
" Use escape to go back to normal mode
tnoremap <Esc> <C-\><C-n>

" }}}
" BRACE COMPLETION {{{
set showmatch
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
" inoremap {}     {}
"
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap ()     ()
"
" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" inoremap []     []
" }}}
" GENERAL/TOGGLEABLE SETTINGS {{{
" horizontal split splits below
set splitbelow

" indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
filetype indent off
au BufNewFile,BufRead *.py
  \ setlocal tabstop=4
  \ shiftwidth=4
  \ softtabstop=4
  \ autoindent
  \ expandtab

" line numbers
set number
" set relativenumber

" show title
set title

" mouse
set mouse-=a

" utf-8 ftw
" nvim sets utf8 by default, wrap in if because prevents reloading vimrc
if !has('nvim')
  set encoding=utf-8
endif

" Ignore case unless use a capital in search (smartcase needs ignore set)
set ignorecase
set smartcase

" Textwidth for folding
set textwidth=100

" }}}
" PLUGINS + CUSTOM FUNCTIONS {{{
" Custom
source ~/.config/nvim/custom/functions.vim
nnoremap <leader>t :call ToggleTodo()<cr>
vnoremap <leader>t :call ToggleTodo()<cr>

" deoplete
let g:deoplete#enable_at_startup=1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" Ripgrep for search
if executable('rg')
  set grepprg=rg\ -i\ --vimgrep

  " Ripgrep on /
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap <leader>/ :Rg<SPACE>
endif

" airline
set laststatus=2

" FZF
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --no-messages "" .'
  set grepprg=rg\ --vimgrep
endif

let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>

  if executable('rg')
    " :Find <term> runs `rg <term>` and passes it to fzf
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --color "always" '.shellescape(<q-args>), 1, <bang>0)
    nnoremap <leader>/ :Find
    nnoremap <leader>' :execute "Find " . expand("<cword>")<cr>
  endif
else
  nnoremap <leader>v :CtrlP<Space><cr>
endif

" ALE
let g:ale_linters = {'go': ['golint', 'gofmt']}
let g:ale_lint_delay = 800
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" }}}y
