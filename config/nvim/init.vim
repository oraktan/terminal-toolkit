" Terminal Toolkit portable Neovim (plugin-free baseline)
let mapleader = ' '
set number relativenumber
set autoindent smartindent expandtab tabstop=4 shiftwidth=4 softtabstop=4
set ignorecase smartcase incsearch hlsearch scrolloff=6 nowrap
set mouse=a
set undofile
set undodir=$XDG_STATE_HOME/nvim-undo
silent! call mkdir(expand(&undodir), 'p')
if has('termguicolors') | set termguicolors | endif
syntax on
filetype plugin indent on
" Safe clipboard fallback in SSH/headless environments
if executable('wl-copy') && !empty($WAYLAND_DISPLAY)
  set clipboard=unnamedplus
endif
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>f :echo expand('%:p')<CR>
nnoremap <leader>x :%d _<CR>
nnoremap <leader>c i```<CR><CR>```<Esc>ki
nnoremap <leader>1 `1
nnoremap <leader>2 `2
nnoremap <leader>3 `3
nnoremap <leader>4 `4
nnoremap <leader>5 `5
nnoremap ö o<Esc>p
nnoremap zz $
vnoremap zz $
onoremap zz $
nnoremap s ma
nnoremap Y v`ay
vnoremap Y `ay
vnoremap < <gv
vnoremap > >gv
augroup toolkit_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END
" Optional plugins are not installed or fetched automatically.
" nvim-tree, Telescope, Markdown Preview can be added later through opt-in provisioning.
