# list_diff_test.exs
# Sample data
existing_ids = Enum.to_list(1..1000)
new_access_level_ids = Enum.to_list(500..1500)

# Measure performance of diff_lists
{time_1, result_1} =
  :timer.tc(fn -> LocalMixProject.ListDiff.diff_lists(existing_ids, new_access_level_ids) end)

IO.puts("diff_lists took #{time_1} microseconds")

# Measure performance of diff_lists_2
{time_2, result_2} =
  :timer.tc(fn -> LocalMixProject.ListDiff..diff_lists_2(existing_ids, new_access_level_ids) end)

IO.puts("diff_lists_2 took #{time_2} microseconds")
