" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" 256 Color terminal
set t_Co=256
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif
" Pathogen
call pathogen#infect()
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Set line-break at 79 char
set lw=79
" Change mapleader
let mapleader=","
" Show whitespace
set list listchars=tab:»\ ,trail:·
" Centralize backups, swapfiles, and undo history
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps//
if exists("&undodir")
	set undodir=~/.vim/undo
end
if has("vms")
	" Do not keep a backup file, use versions instead
	set nobackup
else
	" Keep a backup file
	set backup
endif
" Keep 50 lines of command line history
set history=50
" Show the cursor position all the time
set ruler
" Show line numbers
set number
" Show the filename in the window titlebar
set title
" Display incomplete commands
set showcmd
" Do incremental searching
set incsearch
" Turn mouse on in all modes
if has('mouse')
	set mouse=a
endif
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

"" Scrolling
" Start scrolling three lines before the horizontal window border
set scrolloff=3
set sidescrolloff=15
set sidescroll=1

"" Wildmode completion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*.pyc
set wildignore+=*vim/backups*
set wildignore+=*.png,*.jpg,*.gif

"" Automatic commands
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!
	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	augroup END
else
	" Always set autoindenting on
	set autoindent
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

"" Python language specific
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.
"
" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
	if search('^\t', 'n', 150)
		set shiftwidth=8
		set noexpandtab
	el
		set shiftwidth=4
		set expandtab
	en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Wrap text after a certain number of characters
" Python: 79
" C: 79
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" Automatically indent based on file type:
filetype indent on
" Keep indentation level from previous line:
set autoindent
" Folding based on indentation:
"set foldmethod=indent


"" Keybindings
inoremap <C-f> <C-o>l
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Don't use Ex mode, use Q for formatting
map Q gq
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


"" Colors
let g:jellybeans_background_color_256 = 256
let g:jellybeans_use_lowcolor_black = 0
colors jellybeans


"" Package settings
" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
xmap <leader>c <Plug>SlimeRegionSend
nmap <leader>c <Plug>SlimeParagraphSend
" vim-airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
" Set tab-complete menu to something readable
highlight Pmenu ctermbg=238 gui=bold
" Jedi
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 0
" Syntastic
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pep8', 'mccabe']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" UltiSnips
let g:ultisnips_python_style = 'sphinx'
" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'


