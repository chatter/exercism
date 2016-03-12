defmodule RunLengthEncoder do 
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form. 
  "1H1O1R1S1E" => "HORSE" 
  """
  @spec encode(string) :: String.t
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string, capture: :first)
    |> Enum.map_join(&do_encode/1)
  end

  defp do_encode([string | _]) do
    "#{String.length(string)}#{String.at(string, 0)}"
  end

  @spec decode(string) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\p{L})/, string, capture: :all_but_first)
    |> Enum.map_join(&do_decode/1)
  end

  defp do_decode([count | [string | _]]) do
    String.duplicate(string, elem(Integer.parse(count), 0))
  end
end
