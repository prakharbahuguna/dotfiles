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
set tabstop=4             " Render TABs using this many spaces.
set shiftwidth=4          " Indentation amount for < and > commands.
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

Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'        " Lualine status line
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'airblade/vim-gitgutter'           " Git gutter signs
Plug 'ibhagwan/fzf-lua'                 " Fast searching

call plug#end()

set termguicolors                       " Enable true color support
colorscheme carbonfox                   " Set colorscheme

lua << END
require('lualine').setup()
require("fzf-lua").setup({'fzf-native'})
END
