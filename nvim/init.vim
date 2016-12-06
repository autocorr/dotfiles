"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'julialang/julia-vim'
Plug 'junegunn/vim-easy-align'
Plug 'nanotech/jellybeans.vim'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set lw=79
set list listchars=tab:»\ ,trail:·
set backupdir=~/.config/nvim/backups//
set directory=~/.config/nvim/swaps//
set cursorline
set number
set title
set showcmd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4
autocmd Filetype julia setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype fortran setlocal ts=2 sts=2 sw=2
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom keybindings & commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Don't use Ex mode, use Q for formatting
map Q gq

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Highlight current line and remove highlighting
nnoremap <silent> <leader>m ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <leader>M :call clearmatches()<CR>

" Insert current date or time
nnoremap <leader>d :r !date<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jellybeans_overrides = {
\	'background': {'ctermbg': 'black', '256ctermbg': 'black'},
\	'Todo': {'ctermfg': 'red', 'ctermbg': 'black',
\		'256ctermfg': 'red', '256ctermbg': 'black',
\		'attr': 'bold'},
\	'SpecialKey': {'ctermbg': 'black', '256ctermbg': 'black'},
\}
colors jellybeans


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Packages
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

" Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" UltiSnips
let g:ultisnips_python_style = 'sphinx'

" vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline_theme='jellybeans'

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <C-h> :TmuxNavigateLeft<CR>
nnoremap <C-j> :TmuxNavigateDown<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap <C-l> :TmuxNavigateRight<CR>
nnoremap <C-\> :TmuxNavigatePrevious<CR>

" vim-wiki
let g:vimwiki_list = [{'path': '~/code/notes/', 'path_html': '~/code/vimwiki_html/'}]
autocmd Filetype vimwiki setlocal ts=4 sw=4 expandtab
:autocmd Filetype vimwiki map <leader>d :VimwikiMakeDiaryNote<CR>
:autocmd Filetype vimwiki map <leader>sw :VimwikiSearch<space>
:autocmd Filetype vimwiki map <leader>dg :VimwikiDiaryGenerateLinks<CR>
:autocmd Filetype vimwiki map <leader>di :VimwikiDiaryIndex<CR>

" deoplete
let g:deoplete#enable_at_startup = 1


