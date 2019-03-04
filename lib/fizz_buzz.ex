defmodule FizzBuzz do
  def fizz_buzz(0, 0, _), do: "FizzBuzz"
  def fizz_buzz(0, _, _), do: "Fizz"
  def fizz_buzz(_, 0, _), do: "Buzz"
  def fizz_buzz(_, _, n), do: n

  @doc """
  FizzBuzz

  Returns "FizzBuzz" if n is divisible by both 3 and 5.
  Returns "Fizz" if n is divisible by 3 but not 5.
  Returns "Buzz" if n is divisible by 5 but not 3.
  Returns n itself otherwise.

  ## EXAMPLES

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
