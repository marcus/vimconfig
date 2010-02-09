augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead *.mkd  setf mkd
augroup END 

" Markdown
augroup mkd
  autocmd BufNewFile,BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
