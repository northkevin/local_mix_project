IO.puts("list_diff_test.exs ran!!!!!!")
IO.puts("second line to test watchman works!")

# Sample data
existing_ids = Enum.to_list(1..10000)
new_access_level_ids = Enum.to_list(500..15000)

defmodule Benchmark do
  def run_trials(trials, func) do
    Enum.map(1..trials, fn _ ->
      {time, _result} = :timer.tc(func)
      # Convert to seconds
      time / 1_000_000
    end)
  end

  def average(times) do
    Enum.sum(times) / length(times)
  end

  def compare_times(avg_before, avg_after) do
    if avg_before > avg_after do
      multiplier = Float.round(avg_before / avg_after, 3)

      IO.puts(
        "\nThe 'After' algorithm is faster.\n\tby a factor of #{multiplier}\n\tdifference of #{Float.round(avg_before - avg_after, 3)} seconds"
      )
    else
      multiplier = Float.round(avg_after / avg_before, 3)

      IO.puts(
        "\nThe 'Before' algorithm is faster by a factor of #{multiplier}\n\tdifference of #{Float.round(avg_after - avg_before, 3)} seconds"
      )
    end
  end
end

# Run 10 trials for the "before" algorithm
before_times =
  Benchmark.run_trials(10, fn ->
    Enum.filter(existing_ids, &(&1 not in new_access_level_ids))
    Enum.filter(new_access_level_ids, &(&1 not in existing_ids))
  end)

avg_before = Benchmark.average(before_times)
IO.puts("Average time for 'Before' trials: #{avg_before} seconds")

# Run 10 trials for the "after" algorithm
after_times =
  Benchmark.run_trials(10, fn ->
    existing_ids -- new_access_level_ids
    new_access_level_ids -- existing_ids
  end)

avg_after = Benchmark.average(after_times)
IO.puts("Average time for 'After' trials: #{avg_after} seconds")

# Compare average times
Benchmark.compare_times(avg_before, avg_after)
