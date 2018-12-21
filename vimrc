"dein Scripts-----------------------------
if &compatible
  set nocompatible 
endif

" dein setup
let s:dein_dir = $HOME . '/.vim/dein'

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
 

" Required:
call dein#begin('$HOME/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

call dein#load_toml(s:dein_dir . '/toml/dein.toml', {'lazy': 0})
call dein#load_toml(s:dein_dir . '/toml/dein_lazy.toml', {'lazy': 1})

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

" Required:
call dein#end()
call dein#save_state()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
call dein#install()
endif

" let g:solarized_termcolors=16
syntax enable
" set background=dark
set t_Co=256

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

" カラーテーマの設定
syntax on

" " ---vim-airline の設定
" let g:airline_powerline_fonts = 1
" set laststatus=2
" let g:airline_theme = 'molokai'

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
inoremap <C-e> <C-o>$

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

" macだと，バックスペースが効かなかったので，下の設定を追加
set backspace=indent,eol,start

