augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END 

" Markdown
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
