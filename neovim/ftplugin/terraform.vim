if has("nvim")
    autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync(nil, 1000)
endif
