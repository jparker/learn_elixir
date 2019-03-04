defmodule MyList do
  @moduledoc """
  Exercises from Prorgramming Elixir >= 1.6
  """

  @doc """
  Caesar cipher

      iex> MyList.caesar('ryvkve', 13)
      'elixir'

      iex> MyList.caesar('elixir', 13)
      'ryvkve'
  """
  def caesar([], _), do: []

  def caesar([head | tail], n) when head in ?a..?z do
    s = ?a + rem(head - ?a + n, 26)
    [s | caesar(tail, n)]
  end

  def caesar([head | tail], n) do
    s = ?A + rem(head - ?A + n, 26)
    [s | caesar(tail, n)]
  end

  @doc """
  Return a list of integers starting at `from` and ending at `to` in intervals
  of `by`. If omitted, `by` defaults to 1. Essentially Ruby's Numeric#step.

  ## Examples

      iex> MyList.step(1, 5)
      [1, 2, 3, 4, 5]

      iex> MyList.step(1, 5, 2)
      [1, 3, 5]

      iex> MyList.step(1, 5, -1)
      []

      iex> MyList.step(5, 1, -1)
      [5, 4, 3, 2, 1]

      iex> MyList.step(1, 5, 0)
      ** (RuntimeError) step size must be non-zero
  """
  def step(from, to, by \\ 1)
  def step(_from, _to, 0), do: raise("step size must be non-zero")
  def step(from, to, by) when from > to and by > 0, do: []
  def step(from, to, by) when from < to and by < 0, do: []
  def step(from, to, by), do: [from | step(from + by, to, by)]

  @doc """
  Implementation of List.flatten
  """
  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(element), do: [element]
end
