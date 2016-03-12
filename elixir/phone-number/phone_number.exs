defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw), do: raw |> do_number |> to_string

  defp do_number(raw) do
    digits = Regex.replace(~r/[()-.\s]/, raw, "") |> String.to_char_list

    cond do
      length(digits) == 10 -> digits
      length(digits) == 11 && hd(digits) == ?1 -> tl(digits)
      true -> '0000000000'
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw), do: raw |> do_number |> Enum.slice(0..2) |> to_string

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw), do: raw |> do_number |> _format

  defp _format(number) do
    "(#{Enum.slice(number, 0..2)}) #{Enum.slice(number, 3..5)}-#{Enum.slice(number, 6..9)}"
  end
end
