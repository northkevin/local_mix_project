defmodule LocalMixProject.ListDiff do
  def diff_lists(existing_ids, new_access_level_ids) do
    new_set = MapSet.new(new_access_level_ids)
    existing_set = MapSet.new(existing_ids)

    {to_remove, to_add} =
      Enum.reduce(existing_ids, {[], []}, fn id, {rem, add} ->
        if id in new_set do
          {rem, add}
        else
          {[id | rem], add}
        end
      end)

    to_add =
      Enum.reduce(new_access_level_ids, to_add, fn id, acc ->
        if id in existing_set do
          acc
        else
          [id | acc]
        end
      end)

    {Enum.reverse(to_remove), Enum.reverse(to_add)}
  end

  def diff_lists_2(existing_ids, new_access_level_ids) do
    to_remove = Enum.filter(existing_ids, &(&1 not in new_access_level_ids))
    to_add = Enum.filter(new_access_level_ids, &(&1 not in existing_ids))
    {to_remove, to_add}
  end
end
