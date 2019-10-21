defmodule Example do
  @moduledoc false

  def do_it(arr), do: Enum.map(arr, &bla/1)

  defp bla(item) when rem(item, 5) == 0 and rem(item, 3) == 0, do: "FizzBuzz"
  defp bla(item) when rem(item, 3) == 0, do: "Fizz"
  defp bla(item) when rem(item, 5) == 0, do: "Buzz"
  defp bla(item), do: item
end
