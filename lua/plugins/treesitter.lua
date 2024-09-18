-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "bash",
      "go",
      "groovy",
      "html",
      "javascript",
      "python",
      "terraform",
      "toml",
      "typescript",
      "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    fold = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
