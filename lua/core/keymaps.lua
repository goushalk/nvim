-- lua/core/keymaps.lua
vim.keymap.set('n', '<C-e>', ':Neotree toggle<CR>', {})


-- Lsp keymaps

-- LSP Keymaps (Works after language server attaches)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})       -- Go to definition
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})      -- Go to declaration
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})   -- Go to implementation
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {})       -- List references
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})             -- Hover docs
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})   -- Rename symbol
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Code action
    vim.keymap.set("n", "<leader>f", function()                   -- Format file
      vim.lsp.buf.format({ async = true })
    end, opts)

    vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, {}) -- Show diagnostic
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})     -- Prev diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})     -- Next diagnostic
  end,
})


-- File runner

vim.keymap.set('n', '<leader>r', function()
  local file = vim.fn.expand('%')
  local ext = vim.fn.expand('%:e') -- file extension
  local filename_no_ext = vim.fn.expand('%:r')

  local cmd = ""

  if ext == 'py' then
    cmd = "python3 " .. file
  elseif ext == 'java' then
    cmd = "javac " .. file .. " && java " .. filename_no_ext
  elseif ext == 'sh' or ext == 'bash' then
    cmd = "bash " .. file
  elseif ext == 'js' then
    cmd = "node " .. file
  elseif ext == 'c' then
    cmd = "gcc " .. file .. " -o " .. filename_no_ext .. " && ./" .. filename_no_ext
  elseif ext == 'cpp' or ext == 'cc' or ext == 'cxx' then
    cmd = "g++ " .. file .. " -o " .. filename_no_ext .. " && ./" .. filename_no_ext
  else
    print("No run command defined for *." .. ext .. " files")
    return
  end

  -- Run command in a new split terminal so you don’t lose your editing window
  vim.cmd('split term://' .. cmd)
  vim.cmd('resize 15')  -- make the terminal short
end, { silent = true })


