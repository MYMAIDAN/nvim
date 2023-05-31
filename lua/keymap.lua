
function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

nmap = bind("n", {noremap = false})
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
noremap = bind("i")





nnoremap("<C-f>", "<cmd>lua vim.lsp.buf.format {async = true}<CR>")
nnoremap("<C-b>", "<cmd>CHADopen<CR>")
nnoremap("<C-h>", "<cmd>MundoToggle<CR>")
nnoremap("<C-s>", "<cmd>w<CR>")
nnoremap("<C-p>", "<cmd>Telescope git_files<CR>")
nnoremap("<C-y>", "<cmd>Telescope live_grep<CR>")

-- Copy to system buffer
vnoremap("<C-i>", '"+y')

-- Moving lines
nnoremap("K", ":m .-2<CR>==")
nnoremap("J", ":m .+1<CR>==")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("J", ":m '>+1<CR>gv=gv")

-- Utils
nnoremap("<leader>g", "<cmd>Neogit<CR>")
nnoremap("<C-l>", "<cmd>Telescope project<CR>")
