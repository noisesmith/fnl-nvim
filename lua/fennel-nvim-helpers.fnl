(fn lines-from-range
  [start end]
  (let [buf (vim.api.nvim_get_current_buf)
        lines (vim.api.nvim_buf_get_lines buf start end true)]
    (table.concat lines "\n")))
