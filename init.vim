call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'alvan/vim-closetag'
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'NovaDev94/lightline-onedark'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim' """"""
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocompletion plugin
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot' " language support for many languages
" Streamlined statusline.
Plug 'itchyny/lightline.vim'
Plug 'NovaDev94/lightline-onedark'
Plug 'itchyny/vim-gitbranch'

set laststatus=2

call plug#end()


" Colorscheme configuration
colorscheme one
set background=dark


" basic configurations

set autoindent
set smartindent
set smarttab
set shiftround
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab autoindent smartindent

set number "line numbering
" set relativenumber " Relative line numbering
set ignorecase! " Ignore case in search
set synmaxcol=200 " only syntax highlight first 200cols for performance reasons.
set nowrap
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#33313b
highlight LineNr guibg=#222831


" Some keybindings
let mapleader = "\<Space>"
nnoremap <silent> <C-s> :w <CR>
:tnoremap <Esc> <C-\><C-n>
nnoremap <Down> <c-e>
nnoremap <Up> <c-y>
nnoremap <Left> <c-u>
nnoremap <Right> <c-d>
nnoremap <C-t> :tabnew <CR>
nnoremap <leader>w :tabclose <CR>
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
set pastetoggle=<<leader>p>


" Auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
paste


" Use italics 
let g:onedark_terminal_italics = 1
let g:one_allow_italics = 1
highlight Comment ctermfg=59 guifg=#5C6370 gui=italic


" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>t :NERDTreeToggle<CR>


" Deoplete/jedi configurations.
"''''''''''''''''''''''''''''''
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog ='/usr/bin/python3'


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
      \ 'component': {
      \   'lineinfo': "%{line('.') . ' /' . line('$') . ' :' . col('.')}",
      \ },
      \ }

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
