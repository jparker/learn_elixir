ExUnit.start()

defmodule MyListTest do
  use ExUnit.Case, async: true
  doctest MyList

  test 'flatten' do
    assert [] = MyList.flatten([])
    assert [1,2,3] = MyList.flatten([1,2,3])
    assert [1,2,3,4,5,6] = MyList.flatten([1,[2,3,[4]],5,[[[6]]]])
  end
end
