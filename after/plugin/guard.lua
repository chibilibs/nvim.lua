local ft = require("guard.filetype")

ft("lua"):fmt("lsp"):append("stylua")

ft("typescript,javascript,typescriptreact"):fmt("prettier")

ft("rust"):fmt("lsp"):append("rustfmt")

-- Call setup() LAST!
require("guard").setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
})

vim.keymap.set("n", "<leader>cf", ":GuardFmt<CR>")
