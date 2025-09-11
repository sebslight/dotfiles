vim.api.nvim_create_user_command('RemoveGoPrints', function()
  -- Remove fmt.Print* calls
  vim.cmd [[g/^\s*fmt\.Print/ normal! V%d]]
  -- Clean up possible fmt import line
  vim.cmd [[g/^\s*"fmt"\s*$/d]]
end, {})
