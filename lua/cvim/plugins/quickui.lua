vim.g.quickui_show_tip = 1

local function init_quickui()
  vim.fn["quickui#menu#reset"]()

  -- File
  vim.fn["quickui#menu#install"]("&File", {
    {"&Home", "Startify"},
    {"--", ""},
    {"&Save", "w", "write"},
    {"&Save All", "wa", "write all"},
    {"--", ""},
    {"Open &Finder", "!open ."},
    {"--", ""},
    {"&Quit all", "qa!", "quit all"},
    {"&Reload Vimrc", "source ~/.config/nvim/init.vim"}
  })

  -- Edit
  vim.fn["quickui#menu#install"]("&Edit", {
    {"&Copy", "Startify"},
    {"&Paste", "Startify"},
    {"--", ""},
    {"Open &Finder", "!open ."},
    {"--", ""},
    {"&Reload Vimrc", "source ~/.config/nvim/init.vim"}
  })

  -- View
  vim.fn["quickui#menu#install"]("&Edit", {
    {"&Explorer", "Startify", "侧边栏"},
    -- View
    {"&Tagbar", "Vista!!"}
  })

  -- Code
  vim.fn["quickui#menu#install"]("&Code", {
    -- Rename
    {"&Rename", "Startify", "重命名"},
    {"&Run", "Startify", "运行"},
    {"&Tagbar", "Startify"}
  })
  -- Git
  vim.fn["quickui#menu#install"]("&Git", {
    {"&Copyright", "Startify", "侧边栏"},
    -- View
    {"&Tagbar", "Startify"}
  })
  -- Option
  vim.fn["quickui#menu#install"]("&Option", {
    {"Set &Spell %{&spell? \"Off\":\"On\"}", "set spell!"},
    {"Set &Cursor Line %{&cursorline? \"Off\":\"On\"}", "set cursorline!"},
    {"Set &Paste %{&paste? \"Off\":\"On\"}", "set paste!"}
  })
  -- Text
  vim.fn["quickui#menu#install"]("&Text", {
    -- json vs js obj
    {"JS obj 2 JSON", "set spell!"},
    {"JSON to JS obj", "set spell!"}
  })
  -- Help
  vim.fn["quickui#menu#install"]("H&elp", {
    {"&Cheatsheet", "help index", ""},
    {"T&ips", "help tips", ""},
    {"--", ""},
    {"&Tutorial", "help tutor", ""},
    {"&Quick Reference", "help quickref", ""},
    {"&Summary", "help summary", ""}
  })
end

init_quickui()

vim.g.quickui_color_scheme = "solarized"

vim.g.context_menu_file = {
  {"S&earch in Project", ":lua require'telescope.builtin'.grep_string{search = \"<cword>\"}"},
  {"--"},
  {"Find &Definition", ":lua vim.lsp.buf.declaration()<CR>"},
  {"Find &References", ":lua vim.lsp.buf.references()<CR>"},
  {"Find &Symbol", ":lua vim.lsp.buf.document_symbol()<CR>"},
  {"--"},
  {"Format", ":lua vim.lsp.buf.formatting()<CR>"},
  {"Rename", ":lua vim.lsp.buf.rename()<CR>"},
  {"Action", ":lua vim.lsp.buf.code_action()<CR>"},
  {"--"},
  {"Dash &Help", ":open! dash-plugin://keys=python&query=expand(\"<cword>\")"},
  {"P&ython Doc", "call quickui#tools#python_help(\"\")", "python"}
}

vim.g.context_menu_lua_explorer = {
  {"Cre&ate", "a"},
  {"&Edit", "<C-v>"},
  {"&Tab", "<C-v>"},
  {"Toggle ignored", "I"},
  {"Toggle dotfiles", "H"},
  {"Refresh", "R"}
}
