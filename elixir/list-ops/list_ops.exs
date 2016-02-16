defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
   count(l, 0) 
  end

  defp count([], acc), do: acc
  defp count([head | tail], acc), do: count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], list), do: list 
  defp reverse([head | tail], list), do: reverse(tail, [head | list])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    for i <- l, do: f.(i)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    for i <- l, f.(i), do: i
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc 
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    concat([a, b])
  end

  defp append(a, [head | tail], acc), do: append(a, tail, [head | acc])
  defp append(a, [], acc), do: reverse(acc)

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    f = &[&1|&2]
    reduce(ll, [], &reduce(&1, &2, f)) |> reverse
  end
end
