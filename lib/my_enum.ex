defmodule MyEnum do
  @doc """
  Implementation of Enum.all?/2.
  """
  def all?(_collection, pred \\ & &1)

  def all?([], _pred), do: true

  def all?([head | tail], pred) do
    if pred.(head), do: all?(tail, pred), else: false
  end

  @doc """
  Implementation of Enum.each/2.
  """
  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  @doc """
  Implementation of Enum.filter/2.
  """
  def filter([], _pred), do: []

  def filter([head | tail], pred) do
    if pred.(head) do
      [head | filter(tail, pred)]
    else
      filter(tail, pred)
    end
  end

  @doc """
  Implementation of Enum.split/2.
  """
  def split([], _count), do: {[], []}
  def split(collection, 0), do: {[], collection}

  def split([head | tail], count) when count > 0 do
    {left, right} = split(tail, count - 1)
    {[head | left], right}
  end

  def split(collection, count) do
    index = length(collection) + count
    if index < 0, do: split(collection, 0), else: split(collection, index)
  end

  @doc """
  Implementation of Enum.take/2.
  """
  def take(collection, count) when count < 0 do
    start = length(collection) + count
    if start > 0, do: take(collection, count, start), else: collection
  end

  def take(collection, count, start \\ 0)

  def take([], _count, _start), do: []
  def take(_collection, 0, _start), do: []

  def take([head | tail], count, 0) do
    [head | take(tail, count - 1, 0)]
  end

  def take([_head | tail], count, start) do
    take(tail, count, start - 1)
  end
end
