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
"  echom cmd
  let a:out = system(cmd) 
  cgete a:out
  cope
endfunction

function! s:SimpleGrepInput()
  let s:str=input("Grep:")
  "surround the ' with "" so it won't cause shell error
  let s:str=substitute(s:str,"'", "'\"'\"'", 'g')
  "surrand input with '' so the input won't be translate to anything that you
  "don't know
  let s:str="'".s:str."'"
  
  call <SID>SimpleGrep(s:str)
endfunction

nmap <leader>n :call <SID>SimpleGrepInput()<CR>
nmap <C-n> :call <SID>SimpleGrep('<C-r>=expand("<cword>")<CR>')<CR>
