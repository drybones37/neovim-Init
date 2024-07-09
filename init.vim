
call plug#begin('~/.config/plugged/')
let g:python3_host_prog = '/usr/bin/python3'

" File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'


Plug 'liuchengxu/vim-which-key'
"Plug 'AckslD/nvim-whichkey-setup.lua'

" Terminal
Plug 'vimlab/split-term.vim'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'


" Dart
Plug 'dart-lang/dart-vim-plugin'

" Python
Plug 'mdda/vim-plugin-python'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Text and Typing
Plug 'tpope/vim-surround' 

" Zen Mode
Plug 'junegunn/goyo.vim'
Plug  'folke/zen-mode.nvim'

" Typescript
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Theme
Plug 'morhetz/gruvbox'
Plug 'frazrepo/vim-rainbow'

" Multi
Plug 'mg979/vim-visual-multi', {'branch': 'test'}

call plug#end()

colorscheme gruvbox

set noerrorbells                                              " Don't add sounds for errors
set spell
set number
set wrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start
set splitbelow
set mouse=a
set relativenumber
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Font Size
set guifont=Source\ Code\ Pro:h12


" Map jj to escape in insert mode
inoremap jj <Esc>

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

map <leader>' :10Term <CR>

nnoremap <leader>fr :CocCommand flutter.run <CR>
nnoremap <leader>fd :terminal new output:///flutter-dev <CR>


nnoremap <C-b> :NERDTreeToggle<CR>
" nnoremap <C-S-b> :NERDTreeFind<CR>

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']


" Jekyll

nmap <leader>js :terminal Jekyll serve<CR>

" Markdown Preview
nmap <leader>mp :MarkdownPreview<CR>
nmap <leader>ms :MarkdownPreviewStop<CR>
nmap <leader>mt :MarkdownPreviewToggle<CR>


" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" " Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
  else
	execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
							  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pyright',
	\ 'coc-solargraph',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1

let g:rainbow_active = 1

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == 

" CMD END ================================
