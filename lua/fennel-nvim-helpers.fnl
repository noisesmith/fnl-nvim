(fn range->string
  [start end]
  (let [buf (vim.api.nvim_get_current_buf)
        lines (vim.api.nvim_buf_get_lines buf start end true)]
    (table.concat lines "\n")))

{:range_string range->string}
