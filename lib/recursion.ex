defmodule Recursion do
  @doc """
  Factorial of n.

  ## EXAMPLES

      iex> Recursion.factorial(3)
      6

      iex> Recursion.factorial(7)
      5040

      iex> Recursion.factorial(10)
      3628800

      iex> Recursion.factorial(-1)
      ** (FunctionClauseError) no function clause matching in Recursion.factorial/1
  """
  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  @doc """
  Sum of intergers from 1 to n.

  ## EXAMPLES

      iex> Recursion.sum(0)
      0

      iex> Recursion.sum(1)
      1

      iex> Recursion.sum(10)
      55
  """
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  @doc """
  Greatest common denominator of x and y.

  ## EXAMPLES

      iex> Recursion.gcd(42, 0)
      42

      iex> Recursion.gcd(0, 42)
      42

      iex> Recursion.gcd(12, 20)
      4

      iex> Recursion.gcd(21, 12)
      3

      iex> Recursion.gcd(12, 22)
      2

      iex> Recursion.gcd(12, 23)
      1
  """
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
