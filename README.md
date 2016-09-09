# SimpleGrep
Simple grep plugin for vim , say goodbye to the complicate grep commands

This plugin is really simple so I won't make much word on it

# key binding
`<leader>n` to start a grep search
`<C-n>` to search the word under you cursor

# setting:
`g:grep_exclude_dir` -> A list of dir that you don't wanna search into
  default:  `let g:grep_exclude_dir=[".git", ".svn", ".tmp", "node_model", "vendor"]`

`g:grep_exclude_file` -> A list of file that you don't wanna search into
  default: `let g:grep_exclude_file=[".gitignore"]`
  
Please be aware of a fact that dir is different than file.
