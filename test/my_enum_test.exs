ExUnit.start()

defmodule MyEnumTest do
  use ExUnit.Case, async: true
  doctest MyEnum

  # Make Integer.is_even macro available to tests.
  require Integer

  test 'all?' do
    assert MyEnum.all?([])
    assert MyEnum.all?([true, true])
    refute MyEnum.all?([true, false])
    assert MyEnum.all?([2, 4], &Integer.is_even/1)
    refute MyEnum.all?([2, 3], &Integer.is_even/1)
  end

  test 'each' do
    func = fn x -> send(self(), {:msg, x}) end

    MyEnum.each([], func)
    refute_received {:msg, _}

    MyEnum.each([1, 2], func)
    assert_received {:msg, 1}
    assert_received {:msg, 2}
  end

  test 'filter' do
    assert [] = MyEnum.filter([], &Intger.is_even/1)
    assert [] = MyEnum.filter([1, 3], &Integer.is_even/1)
    assert [2, 4] = MyEnum.filter([1, 2, 3, 4], &Integer.is_even/1)
    assert [1, 3] = MyEnum.filter([1, 2, 3, 4], &Integer.is_odd/1)
  end

  test 'split' do
    assert {[], [1, 2]} = MyEnum.split([1, 2], 0)

    assert {[], []} = MyEnum.split([], 2)
    assert {[1, 2], []} = MyEnum.split([1, 2], 3)
    assert {[1, 2], [3, 4, 5]} = MyEnum.split([1, 2, 3, 4, 5], 2)

    assert {[], []} = MyEnum.split([], -2)
    assert {[], [1, 2]} = MyEnum.split([1, 2], -3)
    assert {[1, 2, 3], [4, 5]} = MyEnum.split([1, 2, 3, 4, 5], -2)
  end

  test 'take' do
    assert [] = MyEnum.take([1, 2], 0)

    assert [] = MyEnum.take([], 2)
    assert [1, 2] = MyEnum.take([1, 2, 3], 2)
    assert [1, 2, 3] = MyEnum.take([1, 2, 3], 5)

    assert [] = MyEnum.take([], -2)
    assert [2, 3] = MyEnum.take([1, 2, 3], -2)
    assert [1, 2, 3] = MyEnum.take([1, 2, 3], -5)
  end
end
