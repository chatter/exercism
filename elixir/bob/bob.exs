defmodule Bob do
  def hey(input) do
    cond do
      String.last(input) == "!" -> "Whoa, chill out!"
      true -> "Whatever."

    end
  end
end
