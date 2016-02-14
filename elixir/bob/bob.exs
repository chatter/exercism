defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r/^[A-Z0-9, ]+!/) -> "Whoa, chill out!"
      String.last(input) == "!" -> "Whatever."
      String.last(input) == "?" -> "Sure."
      true -> "Whatever."

    end
  end
end
