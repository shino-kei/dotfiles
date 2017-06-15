"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('plasticboy/vim-markdown')
"call dein#add('mattn/emmet-vim')
call dein#add('vim-scripts/vim-javascript')
call dein#add('Townk/vim-autoclose')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('othree/html5.vim')
call dein#add ('plasticboy/vim-markdown')
call dein#add ('kannokanno/previm')
call dein#add ('tyru/open-browser.vim')
call dein#add('vim-airline/vim-airline')
" Javascript / node js
call dein#add('vim-scripts/JavaScript-Indent')
call dein#add('scrooloose/syntastic') " javascriptの文法チェック

" IME setting
" call dein#add('vim-scripts/fcitx.vim')
" set timeout timeoutlen=3000 ttimeoutlen=100
"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
  let s:input_status = system("fcitx-remote")
  if s:input_status == 2
    let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
  endif
endfunction

function! Fcitx2zh()
  let s:input_status = system("fcitx-remote")
  if s:input_status != 2 && g:input_toggle == 1
    let l:a = system("fcitx-remote -o")
    let g:input_toggle = 0
  endif
endfunction

set ttimeoutlen=150
"when leaving insert mode
autocmd InsertLeave * call Fcitx2en()
" when entering insert mode
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######


" Unite outline で関数の見出しをつける 
" call dein#add ('Shougo/unite.vim')
" call dein#add ('h1mesuke/unite-outline')

" --見た目系---
call dein#add('tomasr/molokai')
" call dein#add('jdkanani/vim-material-theme')
" quickrun
call dein#add('thinca/vim-quickrun')
" 水平に分割する
let g:quickrun_config={'*': {'split': ''}}

" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>" 


"" c++ settings  
" leader(バックスラッシュ)+cでコメントをトグル
call dein#add("tyru/caw.vim.git")
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
call dein#install()
endif

"End dein Scripts-------------------------


" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示v
set number
" 現在の行を強調表示
" set cursorline

" カラーテーマの設定
colorscheme molokai
" colorscheme material-theme
syntax on
" 256色¬
set t_Co=256
" truecolor¬
set termguicolors
" 背景色¬
set background=dark

" カーソル行を強調表示しない
set nocursorline
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter,InsertLeave * set cursorline!
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent

" 3部コメント以外の単行コメントはオートインデントしない
if has("autocmd")
    autocmd FileType *
      \ let &l:comments
            \=join(filter(split(&l:comments, ','), 'v:val =~ "^[sme]"'), ',')
endif

" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" <C-e>で行末に移動してインサートモードに入る
nnoremap <C-e> $a

" IME設定
" if has('unix')
"   inoremap <silent><Esc> <Esc>:silent call system('fcitx-remote -c" > /dev/null 2>&1')<CR>
"   cnoremap <silent><Esc> <Esc>:silent call system('fcitx-remote -c" > /dev/null 2>&1')<CR>
" endif 

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

" スクリプト実行系
" 編集中のpythonスクリプトを直接実行できるようにする 
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

" macだと，バックスペースが効かなかったので，下の設定を追加
set backspace=indent,eol,start

noremap <F5> <ESC>:call RUN()<ENTER>
function! RUN()                     
  :w|!./%;read                      
endfunction
