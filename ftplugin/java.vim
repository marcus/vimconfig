"Import the class under the cursor with <leader>i.
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

"Search for the javadocs of the element under the cursor with <leader>d.
nnoremap <silent> <buffer> <leader>e :JavaDocSearch -x declarations<cr>

"Perform a context sensitive search of the element under the cursor with <enter>.
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

set tabstop=4
set shiftwidth=4
set softtabstop=4
