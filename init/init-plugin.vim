"======================================================================
"
" init-plugins.vim -.
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
   let g:bundle_group = ['nerdtree', 'ctrlp', 'snippets']
endif

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
   let path = expand(s:home . '/' . a:path )
   return substitute(path, '\\', '/', 'g')
endfunc


"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

if index(g:bundle_group, 'snippets') >= 0
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
endif

"----------------------------------------------------------------------
" CtrlP
"----------------------------------------------------------------------
if index(g:bundle_group, 'ctrlp') >= 0
    Plug 'ctrlpvim/ctrlp.vim'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    let g:ctrlp_map = '<leader-p>'

    nnoremap <leader>f :CtrlP<CR>
    nnoremap <leader>b :CtrlPBuffer<CR>
    nnoremap <leader>m :CtrlPMRUFiles<CR>
    nnoremap <leader>t :CtrlPTag<CR>
    let g:ctrlp_map = ''
endif


"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
if index(g:bundle_group, 'nerdtree') >= 0
	Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeDirArrows = 1
	let g:NERDTreeHijackNetrw = 0
	let g:NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']

	map <F3> :NERDTreeMirror<CR>
	map <F3> :NERDTreeToggle<CR>
	map <leader>n :NERDTreeMirror<CR>
	map <leader>n :NERDTreeToggle<CR>

	"noremap <space>no :NERDTreeFocus<cr>
	"noremap <space>nm :NERDTreeMirror<cr>
	"noremap <space>nn :NERDTreeToggle<cr>

	autocmd StdinReadPre * let s:std_in=1
	" 将nerdtree作为默认的文件浏览器
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	" 关闭最后一个窗口时自动关闭nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


"----------------------------------------------------------------------
" trailing-whitespace 配置
"----------------------------------------------------------------------
map <leader><space> :FixWhitespace<cr>

