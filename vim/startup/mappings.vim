" noremap <C-x> :! pandoc --mathjax --toc -o '%:p:h'/out.pdf '%:p:h'/*.md \| zathura '%:p:h'/out.pdf &<CR><CR>

noremap <TAB><TAB> :source %<CR>

" Movement
noremap H ^
noremap L g_
noremap j gj
noremap k gk
noremap <C-y> <C-y><C-y><C-y>
noremap <C-e> <C-e><C-e><C-e>

" Very magic search
nnoremap +/ /\v
vnoremap +/ /\v
map <C-R> :%s/

" Leader
let mapleader = ","
noremap <Leader>c :Commentary<CR>
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :bd<Return>
map <Leader>f :b

" Function Keys
nmap <silent> <F2> :NERDTreeToggle<CR>
map <F4> :setlocal foldmethod=marker<CR>
map <F6> mzgg=G`z`<CR>

" Fuzzy Finding Splits
nnoremap <silent> <TAB>v :call fzf#run({
      \   'sink':  'vertical botright split',
      \   'source': 'find . -path "*/\.*" -prune -o -type f ! -name "*~" -print -o -type l -print' })<CR>

nnoremap <silent> <TAB>x :call fzf#run({
      \   'sink': 'botright split',
      \   'source': 'find . -path "*/\.*" -prune -o -type f ! -name "*~" -print -o -type l -print' })<CR>

map <C-F> :HFiles<CR>

" Move Lines in Visual Mode
xnoremap K :move '<-2 <CR> gv=gv
xnoremap J :move '>+1 <CR> gv=gv

" Check TODO List with date
nnoremap <F5> lix<Esc>ll"=strftime("%c")<CR>P

" Change SnipMate for YCM
imap <C-C> <esc>a<Plug>snipMateNextOrTrigger
smap <C-C> <Plug>snipMateNextOrTrigger

" Better split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
