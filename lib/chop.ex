defmodule Chop do
  def guess(actual, a..b) do
    n = div(b - a, 2) + a
    send(self(), {:guess, "Is it #{n}"})
    guess(actual, a..b, div(b - a, 2) + a)
  end

  defp guess(actual, _range, actual), do: actual

  defp guess(actual, a.._b, n) when n > actual do
    guess(actual, a..(n - 1))
  end

  defp guess(actual, _a..b, n) do
    guess(actual, (n + 1)..b)
  end
end
