# import_file("scripts/list_diff_test.exs")

# Sample data
existing_ids = Enum.to_list(1..10000)
new_access_level_ids = Enum.to_list(500..15000)

# Before
{time_1, _result_1} =
  :timer.tc(fn ->
    Enum.filter(existing_ids, &(&1 not in new_access_level_ids))
    Enum.filter(new_access_level_ids, &(&1 not in existing_ids))
  end)

IO.puts("Before took #{time_1 / 1_000_000} seconds")

# After
{time_2, _result_2} =
  :timer.tc(fn ->
    existing_ids -- new_access_level_ids
    new_access_level_ids -- existing_ids
  end)

IO.puts("After took #{time_2 / 1_000_000} seconds")
