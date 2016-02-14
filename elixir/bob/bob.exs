defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^\p{Z}*$/) -> "Fine. Be that way!"
      String.match?(input, ~r/^[^a-z]+!?[^?]$/) -> "Whoa, chill out!"
      String.last(input) == "!" -> "Whatever."
      String.last(input) == "?" -> "Sure."
      String.match?(input, ~r/^\p{Lu}$/) -> "Whoa, chill out!"
      true -> "Whatever."

    end
  end
end
