defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^\s*$/) -> "Fine. Be that way!"
      String.match?(input, ~r/^[^a-z]+!?$/) -> "Whoa, chill out!"
      String.last(input) == "!" -> "Whatever."
      String.last(input) == "?" -> "Sure."
      true -> "Whatever."

    end
  end
end
