" Detect ".hcl" files
au BufRead,BufNewFile *.hcl        set filetype=hcl

" Nomad
autocmd BufNewFile,BufRead *.nomad set filetype=nomad

autocmd FileType nomad set syntax=hcl
