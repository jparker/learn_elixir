ExUnit.start()

defmodule MyListTest do
  use ExUnit.Case, async: true
  doctest MyList

  test 'flatten empty list' do
    assert [] = MyList.flatten([])
  end

  test 'flatten flattened list' do
    assert [1, 2, 3] = MyList.flatten([1, 2, 3])
  end

  test 'flatten deeply-nested lists' do
    assert [1, 2, 3, 4, 5, 6] = MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])
  end
end
