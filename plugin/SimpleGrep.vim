if !exists("g:grep_exclude_dir")
  let g:grep_exclude_dir=[".git", ".svn", ".tmp", "node_model", "vendor"]
endif

if !exists("g:grep_exclude_file")
  let g:grep_exclude_file=[".gitignore"]
endif

function! s:SimpleGrep(input)
  let a:excludedir = '{'.join(g:grep_exclude_dir, ',').'}'
  let a:exclude = '{'.join(g:grep_exclude_file,',').'}'
  let cmd = "egrep -InRi --exclude-dir=".a:excludedir." --exclude=".a:exclude." ".a:input." ."
  echom cmd
  let a:out = system(cmd) 
  cgete a:out
  cope
endfunction

function! s:SimpleGrepInput()
  let s:str=input("Grep:")
  call <SID>SimpleGrep(s:str)
endfunction

nmap <leader>n :call <SID>SimpleGrepInput()<CR>
nmap <C-n> :call <SID>SimpleGrep('<C-r>=expand("<cword>")<CR>')<CR>
