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
    |> Enum.reduce("", fn([string | _], acc) ->
         acc <> "#{String.length(string)}#{String.at(string, 0)}"
       end)
  end

  @spec decode(string) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\p{L})/, string, capture: :all_but_first)
    |> Enum.reduce("", fn([count | [string | _]], acc) ->
         acc <> String.duplicate(string, elem(Integer.parse(count), 0))
       end)
  end

  ###
  # Initial version of encode that didn't use regex
  ###
  #
  # def encode(string) do
  #   string
  #   |> String.to_char_list
  #   |> Enum.reduce([], &_chunk/2)
  #   |> Enum.reverse
  #   |> Enum.reduce("", &_shrink/2)
  # end
  #
  # defp _chunk(ele, [] = acc), do: [ [ele] | acc ]
  # defp _chunk(ele, [h | t] = acc) do
  #   cond do
  #     ele == List.first(h) -> [ [ele | h] | t ]
  #     true -> [ [ele] | acc ]
  #   end
  # end
  #
  # defp _shrink([h | _] = ele, acc), do: acc <> "#{length(ele)}#{to_string([h])}"
end
