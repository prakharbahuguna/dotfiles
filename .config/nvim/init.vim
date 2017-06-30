set t_Co=256              " Use 256 colors

let mapleader='\<SPACE>'  " Map the leader key to SPACE
set hidden                " More intuitive behaviour
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set noshowmode            " Don't show current mode, airline does this
set ruler                 " Show the line and column numbers of the cursor.
set cursorline            " Highlight current line
set number                " Show the line numbers on the left side.
set textwidth=80          " Hard-wrap long lines as you type them.
set colorcolumn=+1        " Show right margin after end of width
set expandtab             " Insert spaces when TAB is pressed.
set tabstop=2             " Render TABs using this many spaces.
set shiftwidth=2          " Indentation amount for < and > commands.
set nojoinspaces          " Prevents inserting two spaces after punctuation on a join (J)
set autochdir             " Switch to current file's parent directory.
set timeoutlen=50         " Shorten the timeout
set undofile              " Persistent undo file
set clipboard=unnamedplus " Use system clipboard
set mouse=a               " Enable mouse support

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set listchars=trail:·,tab:▸\ ,precedes:«,extends:»
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  noremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Use ; for commands.
nnoremap ; :

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Function for updating deoplete plugins
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'rakr/vim-one'                     " Atom One themes
Plug 'ctrlpvim/ctrlp.vim'               " CtrlP for opening files
Plug 'vim-airline/vim-airline'          " Airline status line
Plug 'vim-airline/vim-airline-themes'   " Airline themes
Plug 'janko-m/vim-test'                 " Run tests on code
Plug 'benekastah/neomake'               " Make and/or lint
Plug 'jmcantrell/vim-virtualenv'        " Virtualenv support
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Code completion
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'airblade/vim-gitgutter'           " Git gutter signs
Plug 'majutsushi/tagbar'                " Browse tags in file
Plug 'scrooloose/nerdcommenter'         " Easy commenting
Plug 'scrooloose/nerdtree'              " File browser
Plug 'rhysd/vim-clang-format'           " Formatting for C family
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'          " Fast searching
Plug 'sjl/vitality.vim'                 " Tmux/iTerm integration
Plug 'tmux-plugins/vim-tmux'            " Syntax highlighting for tmux config
Plug 'xolox/vim-misc'                   " Required for vim-session
Plug 'xolox/vim-session'                " Smarter session management


call plug#end()

set termguicolors                       " Enable true color support
let g:one_allow_italics = 1             " Enable italics
colorscheme one-dark                    " Set colorscheme

" Configure Airline to use theme, show buffers and use Powerline symbols
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#virtualenv#enabled=1

" Have tmux use a similar theme for its status line
let g:tmuxline_theme='airline'
let g:tmuxline_preset='powerline'

" Configure vim-test to use Neovim terminal
let test#strategy='neoterm'

" Run Neomake on save
autocmd! BufWritePost,BufEnter * Neomake

" Use deoplete.
let g:deoplete#enable_at_startup=1

" Press Ctrl+N to open NERDtree
noremap <C-n> :NERDTreeToggle<CR>
" Press Ctrl+M to open Tagbar
noremap <C-m> :TagbarToggle<CR>

" Enable clang-format for C family code
let g:clang_format#code_style='llvm'    " Use LLVM style
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" Automatically save and load session, with autosave every 2 mins
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_autosave_periodic=2
let g:session_directory='~/.config/nvim/sessions'