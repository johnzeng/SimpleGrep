if !exists("g:grep_exclude_dir")
  let g:grep_exclude_dir=[".git", ".svn", ".tmp", "node_model", "vendor", "log", "logs"]
else
  
endif

if !exists("g:grep_exclude_file")
  let g:grep_exclude_file=[".gitignore", "*.beam", "*.o", "*.pyc", "*.swp", "*.zip", "*.rar"]
endif

function! s:AppendSingleQuate(key, v)
  return "'".a:v."'"
endfunc

function! s:SimpleGrep(input)
  let a:i = 0
  let a:dirlist =  []
  while a:i < len(g:grep_exclude_dir)
      call add(a:dirlist, "'".g:grep_exclude_dir[a:i]."'")
      let a:i = a:i + 1
  endwhile
  let a:excludedir = "{".join(a:dirlist, ',')."}"

  let a:filelist = []

  let a:i = 0
  while a:i < len(g:grep_exclude_file)
      call add(a:filelist, "'".g:grep_exclude_file[a:i]."'")
      let a:i = a:i + 1
  endwhile

  let a:exclude = "{".join(a:filelist,',')."}"
  let a:cmd = "egrep -InRi --exclude-dir=".a:excludedir." --exclude=".a:exclude." ".a:input." ."
  let a:out = system(a:cmd) 
  cgete a:out
  cope
endfunction

function! s:SimpleGrepInput()
  let s:str=input("Grep:")
  "surround the ' with "" so it won't cause shell error
  let s:str=substitute(s:str,"'", "'\"'\"'", 'g')
  "surrand input with '' so the input won't be translate to anything that you
  "don't know
  let s:str= s:AppendSingleQuate(0, s:str)
  
  call <SID>SimpleGrep(s:str)
endfunction

nmap <leader>n :call <SID>SimpleGrepInput()<CR>
nmap <C-n> :call <SID>SimpleGrep('<C-r>=expand("<cword>")<CR>')<CR>
