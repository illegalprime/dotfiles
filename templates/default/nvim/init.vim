" Plugin heplers
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Vim Plugin plugin manager
call plug#begin()

"
" Language Agnostic
"
" Asynchronous maker and linter (needs linters to work)
Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Autocomplete (deciding between the two)
Plug 'Valloric/YouCompleteMe'
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Easy templates for langs
Plug 'aperezdc/vim-template'
" Detect tabs vs. spaces
Plug 'tpope/vim-sleuth'

"
" Rust
"
Plug 'rust-lang/rust.vim'

"
" Prolog
"
Plug 'adimit/prolog.vim'

"
" Idris
"
Plug 'idris-hackers/idris-vim'

"
" Qt
"
Plug 'peterhoeg/vim-qml'

"
" Coq
"
Plug 'jvoorhis/coq.vim'
Plug 'let-def/vimbufsync' " coquille dependency
Plug 'the-lambda-church/coquille'

"
" SMT / z3
"
Plug 'raichoo/smt-vim'

"
" Elixir
"
Plug 'elixir-lang/vim-elixir'

"
" Typescript
"
Plug 'leafgarland/typescript-vim'

"
" Pandoc
"
Plug 'vim-pandoc/vim-pandoc-syntax'

"
" i3
"
Plug 'PotatoesMaster/i3-vim-syntax'

"
" Interface
"
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Unite file searching
Plug 'Shougo/unite.vim'
" History/yank source
Plug 'Shougo/neoyank.vim'
" Outline source
Plug 'Shougo/unite-outline'
" Tag source
Plug 'tsukkee/unite-tag'
" for being able to grep
Plug 'Shougo/vimproc.vim'


"
" Colors!
"
" Hybrid
Plug 'w0ng/vim-hybrid'
" Badwolf
Plug 'sjl/badwolf'
" Molokai
Plug 'tomasr/molokai'
" Iceberg
Plug 'cocopon/iceberg.vim'
" Tender
Plug 'jacoborus/tender.vim'
" Jellybeans
Plug 'nanotech/jellybeans.vim'
" srcery
Plug 'roosta/srcery'
" stereokai
Plug 'gummesson/stereokai.vim'
" Catch-All
Plug 'flazz/vim-colorschemes'

"
" Version Control
"
" git show changes on line numbers
Plug 'airblade/vim-gitgutter'
" fugitive git wrapper
Plug 'tpope/vim-fugitive'
" NERDTree git stuff
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" Colors & Fonts
syntax on
set background=dark
set fillchars+=vert:\ " Literally Whitespace
set cursorline
highlight CursorLine ctermbg=black
set encoding=utf-8
colorscheme landscape

" Line numbers
set number

" Don't redraw when executing macros
set lazyredraw

" Scroll this much off the top of bottom
set scrolloff=5

" Show matching brackets when cursor is on them
set showmatch

" Split settings
set splitbelow
set splitright

" Timeout settings
set notimeout
set ttimeout
set ttimeoutlen=10

" Tabbing
set tabstop=4
set shiftwidth=4
set expandtab

" Spellcheck
set spelllang=en_us
set nospell

" Whitespace characters
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

" Search
set ignorecase
set smartcase
set wrapscan
set nohlsearch

" Don't show the mode, lightline will show it too
set noshowmode

" Blink for matching braces
set matchtime=2

" Clipboard
set clipboard+=unnamedplus

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" set up doxygen highlighting
let g:load_doxygen_syntax=1

" Tab navigation
noremap <C-h> gT
noremap <C-l> gt

" Easier :
noremap ; :

" Set my terminal
set shell=zsh

" Set some info about me
let g:email='themichaeleden@gmail.com'

" Terminal mode mappings
if has('nvim')
  " Easy escaping to normal mode from terminal
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Easy navigation between buffers in a ternimal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Easier tab switching
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" commenting with Ctrl-/
nmap <C-_> gcc
imap <C-_> <Esc>gcla
vmap <C-_> gc

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" Save with Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" Chaning indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Go to next brace with tab
nnoremap <Tab> %

" Replace selection in entire file
vnoremap <C-A-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Persistent undo settings
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

"
" Automation
"
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Set z3 filetype
augroup filetypedetect
    " associate *.z3 with smt filetype
    au BufRead,BufNewFile *.z3 setfiletype smt
augroup END

" Set ocaml commentstrips
" associate *.z3 with smt filetype
au BufRead,BufNewFile *.ml set commentstring=(*\ %s\ *)

" Pandoc Syntax settings
"
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

"
"
" Plugin Settings
"
"
" YouCompleteMe settings
set hidden
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_python_interpreter = '<%= `which python2`.strip %>'
let g:ycm_rust_src_path = '<%= node[:rust][:stdlib] %>'
let g:ycm_global_ycm_extra_conf = '<%= File.join node[:home], ".ycm_extra_conf.py" %>'
set completeopt-=preview

"
" unite settings
"
" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Dont override status line (conflicts with lightline)
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" Utils menu
let g:unite_source_menu_menus.utils = {
      \     'description' : 'Utility commands',
      \ }
let g:unite_source_menu_menus.utils.command_candidates = [
      \       ['Run XMPFilter', 'Annotate'],
      \       ['Format file', 'Format'],
      \       ['Run file', 'Run'],
      \       ['Generate Ctags', 'GTags'],
      \       ['Show notes', 'Notes'],
      \     ]

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage hunk', 'GitGutterStageHunk'],
      \       ['Unstage hunk', 'GitGutterRevertHunk'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Visual log', 'Gitv'],
      \       ['Current file visual log', 'Gitv!'],
      \     ]

" Plug menu
let g:unite_source_menu_menus.plug = {
      \     'description' : 'Plugin management commands',
      \ }
let g:unite_source_menu_menus.plug.command_candidates = [
      \       ['Install plugins', 'PlugInstall'],
      \       ['Update plugins', 'PlugUpdate'],
      \       ['Clean plugins', 'PlugClean'],
      \       ['Upgrade vim-plug', 'PlugUpgrade'],
      \     ]

" My unite menu
let g:unite_source_menu_menus.unite = {
      \     'description' : 'My Unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = [
      \       ['Unite MRUs', 'call utils#uniteMRUs()'],
      \       ['Unite buffers', 'call utils#uniteBuffers()'],
      \       ['Unite file browse', 'call utils#uniteFileBrowse()'],
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite file tags (symbols)', 'call utils#uniteOutline()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \       ['Unite jump history', 'call utils#uniteJumps()'],
      \     ]

" Tag source settings
let g:unite_source_tag_max_name_length=40
let g:unite_source_tag_max_fname_length=50

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  " Runs 'splits' action by <C-s> and <C-v>
  imap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " Exit with escape
  nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
  " Mark candidates
  vmap <silent> <buffer> m <Plug>(unite_toggle_mark_selected_candidates)
  nmap <silent> <buffer> m <Plug>(unite_toggle_mark_current_candidate)
endfunction

" Search files recursively ([o]pen file)
nnoremap <silent> <Space>o :call utils#uniteFileRec()<CR>
" Open a new tab ([O]pen file)
nnoremap <silent> <Space>O :tabedit<CR>:call utils#uniteFileRec()<CR>
" Browse [f]iles in CWD
nnoremap <silent> <Space>f :call utils#uniteFileBrowse()<CR>
" [U]nite sources
nnoremap <silent> <Space>u :call utils#uniteSources()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <Space>b :call utils#uniteBuffers()<CR>
" Search in current file ou[t]line (tags in current file)
nnoremap <silent> <Space>t :call utils#uniteTags()<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <Space>l :call utils#uniteLineSearch()<CR>
" Search in [y]ank history
nnoremap <silent> <Space>y :call utils#uniteYankHistory()<CR>
" Search in outlines
nnoremap <silent> <Space>r :call utils#uniteOutline()<CR>
" Search in registers
nnoremap <silent> <Space>" :call utils#uniteRegisters()<CR>
" Search in opened [w]indow splits
nnoremap <silent> <Space>w :call utils#uniteWindows()<CR>
" Search in latest [j]ump positions
nnoremap <silent> <Space>j :call utils#uniteJumps()<CR>
" Search in my custom unite [m]enu with my commands
nnoremap <silent> <Space>m :call utils#uniteCustomMenu()<CR>
" Seach in help menu for commands
nnoremap <silent> <Space>hc :call utils#uniteCommands()<CR>
" Seach in help menu for mappings
nnoremap <silent> <Space>hm :call utils#uniteMappings()<CR>


" neomake settings
let g:neomake_verbose=0
autocmd! BufWritePost * Neomake
highlight NeomakeError ctermfg=red cterm=bold
highlight NeomakeWarning ctermfg=yellow cterm=bold
let g:neomake_warning_sign = {
      \ 'text': "\ue0b1",
      \ 'texthl': 'NeomakeWarning',
      \ }
let g:neomake_error_sign = {
      \ 'text': "\ue0b1",
      \ 'texthl': 'NeomakeError',
      \ }
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-std=c++11', '-Wall', '-Wextra', '-pedantic'],
   \ }

" Templating Settings
let g:templates_directory = '/home/michael/.config/nvim/templates'

" Git Gutter and NERDTree settings
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='✚'
let g:gitgutter_sign_modified='✱'
let g:gitgutter_sign_removed='✖'
let g:gitgutter_sign_modified_removed='✱'
let g:gitgutter_sign_removed_first_line='✖'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✱",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Nerdtree configuration
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" Enable to turn on nerdtree on startup
" autocmd vimenter * NERDTreeFind | wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Nerdtree mappings
nmap <C-t> :NERDTreeToggle<CR>
imap <C-t> <Esc>:NERDTreeToggle<CR>a

" Vim Easymotion Options
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Lightline configuration
let g:airline_powerline_fonts = 1

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "\uf023"
    else
        return ""
    endif
endfunction

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "✱"
    elseif &modifiable
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? branch." \uf418" : ''
    endif
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ ] ],
      \ },
      \ 'component_function': {
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'fugitive': 'LightLineFugitive'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': { 'left': '\ue0b1', 'right': '\ue0b3' }
      \ }

