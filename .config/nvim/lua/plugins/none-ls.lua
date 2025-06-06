return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.sqlformat,
        null_ls.builtins.formatting.sqlformat,
        null_ls.builtins.completion.spell,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
