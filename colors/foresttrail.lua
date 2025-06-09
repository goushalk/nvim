vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "foresttrail"

local hl = vim.api.nvim_set_hl

-- Base
hl(0, "Normal",         { fg = "#5a473a", bg = "#0e201d" })
hl(0, "Comment",        { fg = "#bad1bf", italic = true })
hl(0, "LineNr",         { fg = "#bfa88f", bg = "#2e4f2f" })
hl(0, "CursorLineNr",   { fg = "#a3b5a6", bold = true })

-- Syntax
hl(0, "String",         { fg = "#8cbf7e" })
hl(0, "Constant",       { fg = "#8cbf7e" })
hl(0, "Function",       { fg = "#d9c6b0", bold = true })
hl(0, "Identifier",     { fg = "#a3b5a6" })
hl(0, "Statement",      { fg = "#74b49b" })
hl(0, "Type",           { fg = "#74b49b" })

-- UI
hl(0, "StatusLine",     { fg = "#d9c6b0", bg = "#3c6e47", bold = true })
hl(0, "VertSplit",      { fg = "#3c6e47" })
hl(0, "Pmenu",          { fg = "#5a473a", bg = "#a3b5a6" })
hl(0, "PmenuSel",       { fg = "#2e4f2f", bg = "#74b49b" })
hl(0, "Visual",         { bg = "#3c6e47" })

-- Optional Extras
hl(0, "Todo",           { fg = "#ffffff", bg = "#74b49b", bold = true })
hl(0, "Error",          { fg = "#ffffff", bg = "#ff5c5c", bold = true })
hl(0, "WarningMsg",     { fg = "#ffae42", bold = true })

