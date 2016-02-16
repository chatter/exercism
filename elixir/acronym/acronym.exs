defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
      |> String.split(~r/[\p{Z}\p{P}]|(?=[A-Z])/, trim: true)
      |> Enum.reduce("", &(&2 <> String.first(&1)))
      |> String.upcase
  end
end
