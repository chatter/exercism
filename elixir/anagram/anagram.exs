defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    b = base |> prepare_string

    candidates
    |> Enum.filter(fn(x) ->
         prepare_string(x) == b and not_same_word(x, base)
       end)
  end

  @spec not_same_word(String.t, String.t) :: Atom
  def not_same_word(a, b), do: String.downcase(a) != String.downcase(b)

  @spec prepare_string(String.t) :: char_list
  defp prepare_string(string) do
    string
    |> String.downcase
    |> String.to_char_list
    |> Enum.sort
  end
end
