-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- Ensure null-ls is properly required
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,

      -- Set a diagnostician for Python (Pylint)
      null_ls.builtins.diagnostics.pylint.with {
        command = "pylint", -- Make sure pylint is installed
        args = { "--output-format", "text", "--score", "no", "--from-stdin", "$FILENAME" }, -- Pylint command line arguments
        to_stdin = true, -- Send file contents via stdin
        diagnostics_format = "[pylint] #{m} [#{c}]", -- Custom message format
      },
    })
  end,
}
