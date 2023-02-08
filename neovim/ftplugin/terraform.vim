if has("nvim")
    autocmd BufWritePre *.tf lua vim.lsp.buf.format({async:true})
endif
