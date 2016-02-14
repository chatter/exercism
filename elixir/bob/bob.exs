defmodule Bob do
  def hey(input) do
    cond do
      String.last(input) == "!" -> "Whoa, chill out!"
      String.last(input) == "?" -> "Sure."
      true -> "Whatever."

    end
  end
end
