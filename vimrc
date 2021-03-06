set nocompatible

if !isdirectory(expand("~/.vim/bundle/vundle"))
  !mkdir -p ~/.vim/bundle
  !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my tpope bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-abolish'

" my vim-scripts bundles
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/TaskList.vim'

" my python bundles
Bundle 'fs111/pydoc.vim'
Bundle 'nvie/vim-flake8'

" my misc bundles
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'gregsexton/gitv'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-operator-user'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'ervandew/supertab'

" set filetype and syntax stuff to on
filetype on
filetype plugin on
filetype indent on
syntax on

" set colorscheme
colorscheme xoria256

" get rid of swapfiles
set noswapfile

" source abbreviations
:so $HOME/config/vim/abbrev.vim

" set leader to , instead of \
let mapleader=","

" ultisnips
let g:UltiSnipsUsePythonVersion = 2

" clang
map <C-K> :pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i

" youcompleteme
let g:ycm_key_list_select_completion = ["<C-n>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<C-p>", "<Up>"]
nmap <leader>ydc :YcmCompleter GoToDeclaration<CR>
nmap <leader>yde :YcmCompleter GoToDefinition<CR>
nmap <leader>yg :YcmCompleter GoTo<CR>

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" youcompleteme and supertab
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ctrl-p config
map <leader>cp :CtrlP<CR>
set wildignore+=*/tmp/,*.so,*.swp,*.zip,*.pyc,*.o,*~,*.obj
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git/', 'cd %s && git ls-files'],
      \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
      \ 3: ['.svn/', 'cd %s && svn -R list'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

if has("autocmd")
  " cmake
  :autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
  :autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
  :autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake

  " some languages are picky about tab format
  :autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  :autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " always open the quickfix window when running make, grep, grepadd and vimgrep
  " autocmd QuickfixCmdPost make,grep,grepadd,vimgrep :botright cwindow
endif

" TaskList
map <leader>tt <Plug>TaskList

" tagbar
noremap <silent> <leader>tg :TagbarToggle<CR>

" indentation and desktop config
" set cindent
set smartindent
set autoindent
set ruler
" set number relativenumber is cooler
set relativenumber
" use this if you do not use line numbering
" set showbreak=…

" numbering
map <leader>an :set number<CR>
map <leader>rn :set relativenumber<CR>

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" tabstops are 4 spaces and expanded
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" enable modeline in files
set modeline

" make command line two lines high
set ch=2

" show special characters, invert with leader-le, spaces with leader-sp and leader-su
if has("win32")
  set listchars=tab:\>\.,eol:$
else
  set listchars=tab:▸\ ,eol:¬
endif
set nolist
nmap <silent> <leader>le :set list!<CR>
nnoremap <silent> <leader>sp :call Preserve("%s/ /./g")<CR>
nnoremap <silent> <leader>su :call Preserve("undo")<CR>

" stop creating backup files
set nobackup

" set the search scan to wrap lines
set wrapscan

" use par as external formatter
set formatprg=par
" set formatprg=par\ -w80req

" set the forward slash to be the slash of note. Backslashes suck
set shellslash

" set visual bell -- i hate that damned beeping
set vb

" allow backspacing over indent, eol, and the start of an insert
set backspace=2

" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
" set cpoptions=ces$

" set the status line the way i like it
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set stl=
set stl+=%f:
set stl+=%m
set stl+=%r
set stl+=Line%lof%L[%p%%]
set stl+=%{fugitive#statusline()}
set stl+=%=
set stl+=Col%c:
set stl+=Buf%n:
set stl+=[%b][0x%B]
set stl+=%#warningmsg#
set stl+=%*

" tell VIM to always put a status line in, even if there is only one window
" switch off with laststatus=0
set laststatus=2

" don't update the display while executing macros
set lazyredraw

" show the current command in the lower right corner
set showcmd

" show the current mode
set showmode

" show matching parentheses
set showmatch

" hide the mouse pointer while typing
set mousehide

" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=ac

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=300

" keep some stuff in the history
set history=100

" these commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" when the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" allow the cursor to go in to "invalid" places
" set virtualedit=all

" these things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" disable encryption (:X)
set key=

" make the command-line completion better
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc
set wildmode=longest:full
if has("mac")
  set wildignorecase
endif

" same as default except that I remove the 'u' option
set complete=.,w,b,t

" when completing by tag, show the whole tag, not just the function name
set showfulltag

" set the textwidth to be 72 chars and wrap during text entry
set textwidth=72
" set formatoptions+=a
" set wrapmargin=5 no effect when textwidth != 0

" enable wrapping
set wrap

" do not break words, does not work with list
set linebreak

" get rid of the silly characters in window separators
set fillchars=""

" Add ignorance of whitespace to diff
" set diffopt+=iwhite

" enable search highlighting and incremental search, toggle with leader-th
set hlsearch
set incsearch
nmap <silent> <leader>th :silent :set hlsearch!<CR>

" Toggle spell checking on and off with leader-s
nmap <silent> <leader>s :set spell!<CR>

" setting spell suggestion to only 5 alternatives
set spellsuggest=5
set spelllang=en

" map ESC to vv and some other useful shortcuts
imap vv <Esc>
map <leader>jj :q<CR>
map <leader>jk :w<CR>
map <leader>jl :wq<CR>
map <leader>j; :qall!<CR>

" enable context search
map <leader>hh <ESC>:exec "help ".expand("<cWORD>")<CR>

" enable Chapter higlight for command file
match ErrorMsg /^* Chapter.*/

" maps to make handling windows a bit easier
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader>sb :wincmd p<CR>
noremap <silent> <leader>s8 :vertical resize 83<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>cw :cclose<CR>
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :vertical resize +10<CR>
noremap <silent> <C-F11> :resize +10<CR>
noremap <silent> <C-F12> :resize -10<CR>

" same for buffers
noremap <silent> <leader>db :bd<CR>

nmap <silent> <leader>ev :tabe $HOME/config/vimrc<CR>
nmap <silent> <leader>sv :so $HOME/config/vimrc<CR>
nmap <silent> <leader>eg :tabe $HOME/config/gvimrc<CR>
nmap <silent> <leader>sg :so $HOME/config/gvimrc<CR>
nmap <silent> <leader>vh :tabe $HOME/config/vim/vimhelp.org<CR>
nmap <silent> <leader>gh :tabe $HOME/config/git/githelp.org<CR>
nmap <silent> <leader>ea :tabe $HOME/config/vim/abbrev.vim<CR>

" use reselect visual when indenting in visual mode
vmap > >gv
vmap < <gv

" search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

" toggle the nerd tree on an off with leader-tn
nmap <leader>nt :NERDTreeToggle<CR>

" toggle gundo
nmap <leader>un :GundoToggle<CR>

" bubble single lines
nmap <leader>bu [e
nmap <leader>bd ]e

" bubble multiple lines
vmap <leader>bu [egv
vmap <leader>bd ]egv

" make tab moving easier
nmap <leader>tn :tabnew<CR>
nmap <leader>tf :tabn<CR>
nmap <leader>tb :tabp<CR>
nmap <leader>tc :tabc<CR>
nmap <leader>on :only<CR>

" visually select the text that was last edited/pasted
nmap gV `[v`]

" cscope mapping
nmap <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>csc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cse :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>csf :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <leader>csi :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>

" cscope for horizontal split
nmap <leader>chs :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>chg :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>chc :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cht :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>che :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>chf :scs find f <C-R>=expand("<cword>")<CR><CR>
nmap <leader>chi :scs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <leader>chd :scs find d <C-R>=expand("<cword>")<CR><CR>

" strip trailing whitespaces with leader-sw and format file with leader-ff
nnoremap <silent> <leader>sw :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <silent> <leader>ff :call Preserve("normal gg=G")<CR>
function! Preserve(command)
  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" enable fast opening of files relative to current
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>evs :vsp %%
map <leader>et :tabe %%

" map leader-ls to :ls
map <leader>ls :ls<CR>

" Bufexplorer
map <leader>be :BufExplorer<CR>

" mappings for fugitive
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>
map <leader>gc :Gcommit<CR>
map <leader>ge :Gvsplit :0<CR>
map <leader>gv :Gitv<CR>
map <leader>gf :Gitv!<CR>
map <leader>dp :diffput<CR>
map <leader>dg :diffget<CR>
map <leader>du :diffupdate<CR>

" mappings pep8
noremap <buffer> <leader>pe :call Flake8()<CR>
noremap! <buffer> <leader>pe <Esc>:call Flake8()<CR>

" mappings pyclewn
noremap <leader>de :Pyclewn pdb<CR>
noremap <leader>dt :Cdetach<CR>
noremap <leader>dm :Cmapkeys<CR>
noremap <leader>du :Cunmapkeys<CR>

" cool mapping for . in visual mode
vnoremap . :norm<CR>

" show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" neat function to replace a string in all occurences in all files
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" browse back with .. in git blobs or trees, jump to commit with C
if has("autocmd")
  autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif

  " auto delete fugitive buffers on close
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" run any shell command and get result in new windows, eg :R ls -ld ~
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" disable background color erase (bce) so that color schemes render properly
if &term =~ '256color'
  set t_ut=
endif

" vim: set ts=2 sts=2 sw=2 expandtab:
