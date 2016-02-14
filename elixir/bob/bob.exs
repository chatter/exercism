defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) -> "Fine. Be that way!"
      yelling?(input) -> "Whoa, chill out!"
      sure?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp silent?(input), do: String.match?(input, ~r/^\p{Z}*$/)
  defp yelling?(input), do: String.match?(input, ~r/^(?=.*\p{Lu})[\P{Ll}]+!?[^?]$/)
  defp whatever?(input), do: String.last(input) == "!" 
  defp sure?(input), do: String.last(input) == "?"
end

