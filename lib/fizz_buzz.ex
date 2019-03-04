defmodule FizzBuzz do
  @doc """
  iex> FizzBuzz.fizz_buzz(0, 0, 42)
  "FizzBuzz"

  iex> FizzBuzz.fizz_buzz(0, 42, 42)
  "Fizz"

  iex> FizzBuzz.fizz_buzz(42, 0, 42)
  "Buzz"

  iex> FizzBuzz.fizz_buzz(42, 42, 42)
  42
  """
  def fizz_buzz(0, 0, _), do: "FizzBuzz"
  def fizz_buzz(0, _, _), do: "Fizz"
  def fizz_buzz(_, 0, _), do: "Buzz"
  def fizz_buzz(_, _, n), do: n

  @doc """
  iex> FizzBuzz.fizz_buzz(10)
  "Buzz"

  iex> FizzBuzz.fizz_buzz(11)
  11

  iex> FizzBuzz.fizz_buzz(12)
  "Fizz"

  iex> FizzBuzz.fizz_buzz(13)
  13

  iex> FizzBuzz.fizz_buzz(14)
  14

  iex> FizzBuzz.fizz_buzz(15)
  "FizzBuzz"

  iex> FizzBuzz.fizz_buzz(16)
  16
  """
  def fizz_buzz(n) do
    fizz_buzz(rem(n, 3), rem(n, 5), n)
  end
end
