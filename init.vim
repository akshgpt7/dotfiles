call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible' " Some common configurations
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'alvan/vim-closetag' " Close html tags
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocompletion plugin
Plug 'Shougo/neco-syntax' " Keywords autocompletion for various languages
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' } " (somewhat) smart autocompletion
Plug 'sheerun/vim-polyglot' " language support for many languages
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim' " Status line
Plug 'itchyny/vim-gitbranch'
Plug 'ryanoasis/vim-devicons'

set laststatus=2

call plug#end()


" Colorscheme configuration
let g:sonokai_style = 'andromeda'
colorscheme sonokai
syntax on
highlight LineNr guibg=#25292e


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
set relativenumber " Relative line numbering
set ignorecase! " Ignore case in search
set synmaxcol=200 " only syntax highlight first 200cols for performance reasons.
set nowrap
set colorcolumn=80


" Some keybindings
nnoremap <silent> <C-s> :w <CR>
:tnoremap <Esc> <C-\><C-n>
nnoremap <Down> <c-e>
nnoremap <Up> <c-y>
nnoremap <Left> <c-u>
nnoremap <Right> <c-d>
nnoremap <C-t> :tabnew <CR>
nnoremap <leader>w :tabclose <CR>
nnoremap <leader>f :FZF <CR>
nnoremap <leader>g :Rg <CR>
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))


" Auto paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


" CHADTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>t :CHADopen<CR>

" Blue:  #00bcd4 #5fdde5
let g:chadtree_colours = {
      \ '8_bit': {
      \ 'Blue': {'hl24': '#00bcd4'},
      \ 'Green': {'hl24': '#bef992'},
      \ 'Magenta': {'hl24': '#f638dc'},
      \ 'Cyan': {'hl24': '#21e6c1'},
      \ }
      \ }


" Deoplete configurations.
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


" Some nice colorchemes for playing around
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug  'danilo-augusto/vim-afterglow' 
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'ayu-theme/ayu-vim'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'rakr/vim-one'
