call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'  """"""
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'NovaDev94/lightline-onedark'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim' """"""
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocompletion plugin
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot' " language support for many languages
" Streamlined statusline.
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'NovaDev94/lightline-onedark'
Plug 'itchyny/vim-gitbranch'

set laststatus=2

call plug#end()


" Colorscheme configuration
set background=dark
colorscheme onedark

" basic configurations
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
set number "line numbering
set relativenumber " Relative line numbering
set ignorecase! " Ignore case in search
set synmaxcol=200 " only syntax highlight first 200cols for performance reasons.


" insert autocmd for indentations here


" Use italics 
let g:onedark_terminal_italics = 1
let g:one_allow_italics = 1

highlight Comment ctermfg=59 guifg=#5C6370 gui=italic

" Cursor configuration
highlight Cursor guifg=white guibg=black
" Insert mode is iCursor
highlight iCursor guifg=white guibg=steelblue

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>t :NERDTreeToggle<CR>

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
" (Sourced from http://nerditya.com/code/guide-to-neovim/)
"if &listchars ==# 'eol:$'
"  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"endif
"set list                " Show problematic characters.

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
