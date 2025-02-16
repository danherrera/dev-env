vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

vim.keymap.set("n", "<A-j>", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<A-k>", ":cnext<CR>", { silent = true })

vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set("v", "<leader>y", '"+y')
