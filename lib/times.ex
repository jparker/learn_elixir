defmodule Times do
  @doc """
      iex> Times.double(0)
      0

      iex> Times.double(1)
      2

      iex> Times.double(21)
      42
  """
  def double(n), do: n * 2

  @doc """
      iex> Times.triple(0)
      0

      iex> Times.triple(1)
      3

      iex> Times.triple(21)
      63
  """
  def triple(n), do: n * 3

  @doc """
      iex> Times.quadruple(0)
      0

      iex> Times.quadruple(1)
      4

      iex> Times.quadruple(21)
      84
  """
  def quadruple(n), do: double(double(n))
end
