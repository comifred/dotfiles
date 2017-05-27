" This is Fred's .vimrc file
" vim:set fdm=syntax ts=2 sts=2 sw=2

" Variables {{{
let mapleader=";"
" }}}


" Basic Config {{{
set nocompatible            " be iMproved, required
set hidden                  " allow unsaved background buffers and remember marks/undo for them
set history=3000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
syntax on                           " Enable highlighting for syntax
syntax enable
set mouse=a
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase            " make searches case-sensitive only if they contain upper-case characters
set foldmethod=syntax
set nofoldenable
highlight Search ctermbg=grey ctermfg=black
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
set ruler
"set number
"set cursorcolumn
set nowrap
set cursorline                      " highlight current line
set cmdheight=1
set switchbuf=useopen
set showtabline=2                   " Always show tab bar at the top
"set winwidth=79
set shell=bash
set t_ti= t_te=                     " Prevent Vim from clobbering the scrollback buffer.
set scrolloff=3                     " keep more context when scrolling off the end of a buffer
set nobackup                        " Don't make backups at all
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set showcmd                         " display incomplete commands
set wildmode=longest,list
set wildmenu                        " build-in auto completion of vim
set nojoinspaces                    " Insert only one space when joining lines that contain sentence-terminating punctuation
set autoread                        " If a file is changed outside of vim, automatically reload it without asking
"set re=1                            " Set vim regex engine version
set encoding=utf-8
"}}}


" Plugin settings {{{
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim   " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'       " let Vundle manage Vundle, required
filetype plugin indent on    " required

" Repeat.vim remaps . in a way that plugins can tap into it.
" namp <silent> YouMap :call repeat#set("\<Plug>YouMap", v:count) <CR>
Plugin 'tpope/vim-repeat'

" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim. Need make. See :h complete-functions.
Plugin 'Valloric/YouCompleteMe', {'pinned': 1} "{{{
    highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
    highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
    let g:ycm_complete_in_comments=1    " use YCM in comment
    let g:ycm_confirm_extra_conf=0
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    let g:ycm_collect_identifiers_from_tags_files=1
    " integrate YCM with OmniCppComplete
    inoremap <leader>; <C-x><C-o>
    let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
    set completeopt-=preview
    let g:ycm_min_num_of_chars_for_completion=2     " auto complete from the second chars
    let g:ycm_cache_omnifunc=0                      " disable cache
    let g:ycm_seed_identifiers_with_syntax=1
    nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    let g:ycm_show_diagnostics_ui = 0
"}}}

" A simple vim plugin for toggling the display of the quickfix list and the location "
Plugin 'Valloric/ListToggle'    "{{{
    let g:lt_location_list_toggle_map = '<leader>l'
    let g:lt_quickfix_list_toggle_map = '<leader>q'
    let g:lt_height = 10
"}}}

" UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
Plugin 'SirVer/ultisnips'  "{{{
    let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/"
    let g:UltiSnipsExpandTrigger="<Leader><tab>"
    let g:UltiSnipsJumpForwardTrigger="<Leader><tab>"
    let g:UltiSnipsJumpBackwardTrigger="<Leader><s-tab>"
    let g:UltiSnipsEditSplit="vertical"         " If you want :UltiSnipsEdit to split your window.
"}}}
" Snippets are separated from the engine. Add this if you want them, this contains snippets files for various programming languages. See :help UltiSnips
Plugin 'honza/vim-snippets'
" Snippets for class
Plugin 'derekwyatt/vim-fswitch', {'pinned': 1}
Plugin 'derekwyatt/vim-protodef', {'pinned': 1}     "{{{
    let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
    let g:disable_protodef_sorting=1
"}}}

" Vim plugin for intensely orgasmic commenting, need filetype plugin on
Plugin 'scrooloose/nerdcommenter'   "{{{
    nmap <Leader>cc :NERDComComment<CR>
    nmap <Leader>cn :NERDComNestedComment<CR>
    nmap <Leader>c<space> :NERDComToggleComment<CR>
    nmap <Leader>ci :NERDComInvertComment<CR>
    nmap <Leader>c$ :NERDComEOLComment<CR>
    nmap <Leader>cu :NERDComUncommentLine<CR>
"}}}

" The NERD tree allows you to explore your filesystem and to open files and directories.
Plugin 'scrooloose/nerdtree'    "{{{
    let NERDTreeWinSize=32
    let NERDTreeWinPos="right"
    let NERDTreeShowHidden=1
    let NERDTreeMinimalUI=1
    let NERDTreeAutoDeleteBuffer=1
    nmap <F5> :NERDTreeToggle<cr>
    " switch between tab of NERDTree, use gt or gT is intra key of nn or np
    nmap  <Leader>nn :tabn<CR>
    nmap  <Leader>np :tabp<CR>
    nmap  <Leader>nw :tabnew<CR>
    nmap  <Leader>nc :tabclose<CR>
"}}}

" it's useful to line up text and switch among tabs.
Plugin 'godlygeek/tabular'   "{{{
    nnoremap [b :bp<CR>
    nnoremap ]b :bn<CR>
    map <leader>1 :b 1<CR>
    map <leader>2 :b 2<CR>
    map <leader>3 :b 3<CR>
    map <leader>4 :b 4<CR>
    map <leader>5 :b 5<CR>
    map <leader>6 :b 6<CR>
    map <leader>7 :b 7<CR>
    map <leader>8 :b 8<CR>
    map <leader>9 :b 9<CR>
"}}}

" quickly highlight <cword> or visually selected word http://www.vim.org/scripts/script.php?script_id=3692
Plugin 't9md/vim-quickhl'   "{{{
    nmap <silent> <Space>m <Plug>(quickhl-manual-this) :call repeat#set("\<Plug>(quickhl-manual-this)") <CR>
    xmap <Space>m <Plug>(quickhl-manual-this)
    nmap <Space>M <Plug>(quickhl-manual-reset)
    xmap <Space>M <Plug>(quickhl-manual-reset)
    nmap <Space>j <Plug>(quickhl-cword-toggle)
    nmap <Space>] <Plug>(quickhl-tag-toggle)
    map H <Plug>(operator-quickhl-manual-this-motion)
"}}}

" This plugin is a front for ag, A.K.A. the_silver_searcher. Ag can be used as a replacement for 153% of the uses of ack. Need yum install the_silver_searcher
Plugin 'rking/ag.vim'       "{{{
    let g:ackprg = 'ag --nogroup --nocolor --column'
    set runtimepath^=~/.vim/bundle/ag
"}}}

" An ack/ag/pt powered code search and view tool, need Ack2 installed. See :h ctrlsf-arguments
Plugin 'dyng/ctrlsf.vim'    "{{{
    nnoremap <Leader>sf :CtrlSF<CR>
    "nnoremap <Leader>sq :CtrlSFQuickfix<CR>
    nmap     <Leader>sF <Plug>CtrlSFPrompt
    nnoremap <Leader>su :CtrlSFUpdate<CR>
    nnoremap <Leader>so :CtrlSFOpen<CR>
    nnoremap <Leader>st :CtrlSFToggle<CR>
"}}}

" A few of quick commands to swtich between source files and header files quickly.
Plugin 'vim-scripts/a.vim'      "{{{
    nmap <Leader>ch :A<CR>
    nmap <Leader>sch :AS<CR>
"}}}

" Plugin generates symbol dependency tree (aka call tree, call graph) in real-time inside Vim using a Cscope database.
" cp -f ~/.vim/bundle/CCTree/ftplugin/cctree.vim ~/.vim/plugin/
" It's slow, be patient
Plugin 'vim-scripts/CCTree'     "{{{
    let CCTreeEnhancedSymbolProcessing = 1
    nmap <Leader>zl  :CCTreeLoadDB cscope.out<CR>
    nmap <Leader>xl  :CCTreeLoadXRefDBFromDisk cctree.out<CR>
    nmap <Leader>xs  :CCTreeSaveXRefDB cctree.out<CR>
    nmap <Leader>zs  :CCTreeShowLoadedDBs<CR>
    nmap <Leader>zf  :CCTreeTraceForward<CR>
    nmap <Leader>zr  :CCTreeTraceReverse<CR>
    nmap <Leader>z=  :CCTreeRecurseDepthPlus<CR>
    nmap <Leader>z-  :CCTreeRecurseDepthMinus<CR>
    nmap <Leader>zy  :CCTreeWindowSaveCopy<CR>
    nmap <Leader>zw  :CCTreeWindowToggle<CR>
    "autocmd VimEnter if filereadable('cscope.out') | CCTreeLoadDB cscope.out | endif
    autocmd VimEnter if filereadable('cctree.out') | CCTreeLoadXRefDbFromDisk cctree.out | endif
"}}}

" a source code browser plugin for Vim
Plugin 'vim-scripts/taglist.vim'    "{{{
    let tagbar_left=1
    let tagbar_width=32
    nnoremap <Leader>tg :Tlist<CR>
    nmap <Leader>tn :tnext<CR>
    nmap <Leader>tp :tprevious<CR>
    nmap <Leader>tl :tlast<CR>
"}}}

" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more. Command: yss, ysiw, cs, ds; Example: yss], ysiw", yss<p>, cs"', ds"
Plugin 'tpope/vim-surround'

" insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'

" Better Rainbow Parentheses. :RainbowParenthesesToggle  #Toggle it on/off
Plugin 'kien/rainbow_parentheses.vim'  "{{{
    let g:rbpt_max = 16
    nmap <Leader>rp :RainbowParenthesesToggle<CR>
    nmap <Leader>r[ :RainbowParenthesesLoadSquare<CR>
    nmap <Leader>rb :RainbowParenthesesLoadBraces<CR>
    nmap <Leader>r, :RainbowParenthesesLoadChevrons<CR>
    autocmd VimEnter * RainbowParenthesesToggle
"}}}

" vimproc is a great asynchronous execution library for Vim. Need Make
Plugin 'shougo/vimproc.vim', {'pinned': 1, 'do' : 'make'}

" The unite or unite.vim plug-in can search and display information from arbitrary sources like files, buffers, recently used files or registers.
Plugin 'shougo/unite.vim', {'pinned': 1}    "{{{
    nmap  <Leader>ub :Unite -start-insert buffer<CR>
    nmap  <Leader>uf :Unite -start-insert file file_rec<CR>
    nmap  <Leader>ux :Unite -start-insert buffer file file_rec<CR>
    nmap  <Leader>ul :Unite -start-insert -no-tab line<CR>
    nmap  <Leader>uc :UniteClose<CR>
"}}}

" fugitive.vim may very well be the best Git wrapper of all time.
Plugin 'tpope/vim-fugitive'

" Lean & mean status/tabline for vim that's light as air. Replace vim-powerline above. Vim-airline integrates with a variety of plugins out of the box,
" including ctrlp,unite,tagbar,csv,syntastic,hunks,virtualenv,tmuxline,promptline,ctrlspace. So we turn them off. See :help airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'     "{{{
    set t_Co=256
    "set ambiwidth=double
    "set invlist
    let g:airline_powerline_fonts = 0
    "let g:airline_theme='dark'
    let g:airline_skip_empty_sections = 1
    "let g:airline_section_error = '%l'
    "let g:airline_section_warning = '%c'
    let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z'] ]
    let g:airline_extensions = ['branch', 'tabline']
    let g:airline#extensions#syntastic#enabled = 0
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
"}}}

" Molokai is a Vim port of the monokai theme for TextMate originally created by Wimer Hazenberg. Molokai -- 多彩, solarized -- 素朴, phd -- 古典
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/phd'

" Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
Plugin 'edkolev/tmuxline.vim'

" vim-signature is a plugin to place, toggle and display marks. Quick CMD: mx dmx m- m<Space> ]` [` ]' [' ]- [- m[0-9] m?
Plugin 'kshenoy/vim-signature'

" multiple selection feature like Sublime Text's awesome multiple selection feature
" Press <F6> to start, and use <C-m> to select, then press 'c' or 's' to change together
Plugin 'terryma/vim-multiple-cursors'   "{{{
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_start_key='<F6>'
    let g:multi_cursor_quit_key='<Esc>'
"}}}

" EasyMotion provides a much simpler way to use some motions in vim.
" Move to char <Leader>s, move to pre char <Leader>gE, move to next char <Leader>f, move to word <Leader>w.
" The default leader has been changed to <Leader><Leader>.
Plugin 'easymotion/vim-easymotion'  "{{{
    let g:EasyMotion_smartcase = 1
    map <Leader><Leader>l <Plug>(easymotion-lineforward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><Leader>h <Plug>(easymotion-linebackward)
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
"}}}

" Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plugin 'sjl/gundo.vim'      "{{{
    nnoremap <leader>gu :GundoToggle<CR>
"}}}

" Run commands quickly, useful for script.
Plugin 'thinca/vim-quickrun'

" This plugin causes all trailing whitespace to be highlighted in red.
Plugin 'bronson/vim-trailing-whitespace'    "{{{
    map <leader><space> :FixWhitespace<CR>
"}}}

" The tabular plugin must come before vim-markdown.
Plugin 'plasticboy/vim-markdown.git'        "{{{
    let g:vim_markdown_math = 1
    let g:vim_markdown_frontmatter = 1
    let g:markdown_enable_conceal = 1
    let g:vim_markdown_new_list_item_indent = 2
"}}}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"}}}


" Misc settings     {{{
" scheme setting
"set background=dark
"let g:molokai_original = 1
colorscheme molokai

filetype indent on
filetype on

set tags+=tags
set tags+=../tags
set tags+=../../tags

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    set cscopetag
    set cscopequickfix=s-,c-,d-,t-,e-,i-,f-
endif
nmap <C-f>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-f>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-f>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap lb 0
nmap le $
"copy to system
vnoremap <Leader>y "+y
"paste from system
nmap <Leader>p "+p
nmap <Leader>W :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap nw <C-W><C-W>
"nnoremap <Leader>wl <C-W>l
"nnoremap <Leader>wh <C-W>h
"nnoremap <Leader>wk <C-W>k
"nnoremap <Leader>wj <C-W>j
nmap <Leader>pa %

nmap <Leader>c :cclose<CR>
nmap <Leader>o :copen<CR>
nmap <Leader>n :cnext<CR>
nmap <Leader>p :cprev<CR>

"source ~/.vim/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

" save and restore session
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set undofile
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

autocmd FileType php let b:surround_45 = "<?php \r ?>"
"autocmd BufWritePost $MYVIMRC source $MYVIMRC      " apply change immediately
"}}}
