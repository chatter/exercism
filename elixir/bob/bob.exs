defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^\p{Z}*$/) -> "Fine. Be that way!"
      String.match?(input, ~r/^(?=.*\p{Lu})[\P{Ll}]+!?[^?]$/) -> "Whoa, chill out!"
      String.last(input) == "!" -> "Whatever."
      String.last(input) == "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
