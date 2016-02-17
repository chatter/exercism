defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      Enum.count(a) == 0 -> :sublist
      Enum.count(b) == 0 -> :superlist
      do_subset?(a, b) -> :sublist
      do_subset?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp do_subset?(a, []), do: false
  defp do_subset?(a, [head | tail] = b) do
    count_a = Enum.count(a)
    cond do
      Enum.count(b) < count_a -> false
      a === Enum.take(b, count_a) -> true
      true -> do_subset?(a, tail)
    end
  end
end
