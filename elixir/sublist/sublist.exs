defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      subset?(b, a) -> :sublist
      subset?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp subset?(a, b) when length(a) < length(b), do: false
  defp subset?(_, []), do: true
  defp subset?(a, b), do: b in Stream.chunk(a, length(b), 1)
end
