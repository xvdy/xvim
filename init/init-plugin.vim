"======================================================================
"
" init-plugins.vim -.
"
" Created by skywind on 2018/05/31
" Last Modified: 2018/06/10 23:11
"
"======================================================================

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
   " let g:bundle_group = ['nerdtree', 'ctrlp']
   let g:bundle_group = ['nerdtree', 'fzf', 'snippets', 'lsp']
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
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
endif

"----------------------------------------------------------------------
" CtrlP
"----------------------------------------------------------------------
if index(g:bundle_group, 'ctrlp') >= 0
    Plug 'ctrlpvim/ctrlp.vim'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    let g:ctrlp_map = '<leader-p>'

    nnoremap <leader>sf :CtrlP<CR>
    nnoremap <leader>sb :CtrlPBuffer<CR>
    nnoremap <leader>sm :CtrlPMRUFiles<CR>
    nnoremap <leader>st :CtrlPTag<CR>
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
	noremap <space>nm :NERDTreeMirror<cr>
	"noremap <space>nn :NERDTreeToggle<cr>

	autocmd StdinReadPre * let s:std_in=1
	" 将nerdtree作为默认的文件浏览器
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	" 关闭最后一个窗口时自动关闭nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif

if index(g:bundle_group, 'fzf') >= 0
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	map <leader>sf :Files <CR>
	map <leader>sg :Rg <CR>
	map <leader>sr :History <CR>
	map <leader>sh :History: <CR>
	inoremap <c-;> <esc>:Snippets <CR>
endif

if index(g:bundle_group, 'lsp') >= 0
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nmap <buffer> gd <plug>(lsp-definition)
        nmap <buffer> gs <plug>(lsp-document-symbol-search)
        nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nmap <buffer> gr <plug>(lsp-references)
        nmap <buffer> gi <plug>(lsp-implementation)
        nmap <buffer> gt <plug>(lsp-type-definition)
        nmap <buffer> <leader>rn <plug>(lsp-rename)
        nmap <buffer> [g <plug>(lsp-previous-diagnostic)
        nmap <buffer> ]g <plug>(lsp-next-diagnostic)
        nmap <buffer> K <plug>(lsp-hover)
        nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
        nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

        let g:lsp_format_sync_timeout = 1000
        autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
    endfunction

    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END


    Plug 'prabirshrestha/asyncomplete.vim'
    " https://github.com/prabirshrestha/asyncomplete.vim?tab=readme-ov-file
    " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    imap <S-Tab> <Plug>(asyncomplete_force_refresh)

    Plug 'prabirshrestha/asyncomplete-lsp.vim'

endif


"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()


"----------------------------------------------------------------------
" trailing-whitespace 配置
"----------------------------------------------------------------------
map <leader><space> :FixWhitespace<cr>

tnoremap <c-f7> <C-\><C-n><C-w><C-w>
