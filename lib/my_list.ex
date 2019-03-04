defmodule MyList do
  @moduledoc """
  Exercises from Prorgramming Elixir >= 1.6
  """

  @doc  """
  Reimplementation of Enum.map/2

  ## Examples

  iex> MyList.map([1,2,3], &(&1 * &1))
  [1, 4, 9]

  """
  def map([], _func), do: []
  def map([head|tail], func) do
    [func.(head)|map(tail, func)]
  end

  def reduce([], value, _func), do: value
  def reduce([head|tail], value, func) do
    reduce tail, func.(value, head), func
  end

  def mapsum([], _func), do: 0
  def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)

  def max([a]), do: a
  def max([a,b|tail]) when a > b, do: max([a|tail])
  def max([_,b|tail]), do: max([b|tail])

  def caesar([], _), do: []
  def caesar([x|tail], n) when x in ?a..?z do
    s = ?a + rem(x - ?a + n, 26)
    [s|caesar(tail, n)]
  end
  def caesar([x|tail], n) do
    s = ?A + rem(x - ?A + n, 26)
    [s|caesar(tail, n)]
  end

  @doc """
  Return a list of integers starting at +from+ and ending at +to+.

  ## Examples

  iex> MyList.span(1, 5)
  [1, 2, 3, 4, 5]

  iex> MyList.span(1, 1)
  [1]

  iex> MyList.span(5, 1)
  []
  """
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from|span(from + 1, to)]

  @doc """
  Return a list of integers starting at +from+ and ending at +to+ in intervals
  of +by+. Essentially Ruby's Numeric#step.

  ## Examples

  iex> MyList.step(1, 5)
  [1, 2, 3, 4, 5]

  iex> MyList.step(1, 5, 2)
  [1, 3, 5]

  iex> MyList.step(1, 5, -2)
  []

  iex> MyList.step(5, 1, -2)
  [5, 3, 1]
  """
  def step(from, to, by \\ 1)
  def step(_from, _to, 0), do: raise "step size must be non-zero"
  def step(from, to, by) when from > to and by > 0, do: []
  def step(from, to, by) when from < to and by < 0, do: []
  def step(from, to, by), do: [from|step(from + by, to, by)]

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(element), do: [element]
end
