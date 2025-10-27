return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  config = function()
    local ok_comment, Comment = pcall(require, 'Comment')
    if not ok_comment then
      return
    end

    local ok_ctx, ctx = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
    Comment.setup {
      pre_hook = ok_ctx and ctx.create_pre_hook() or nil,
    }
  end,
}
