defmodule ChopTest do
  use ExUnit.Case

  test 'guess' do
    assert 273 = Chop.guess(273, 1..1000)
    assert_received {:guess, "Is it 500"}
    assert_received {:guess, "Is it 250"}
    assert_received {:guess, "Is it 375"}
    assert_received {:guess, "Is it 312"}
    assert_received {:guess, "Is it 281"}
    assert_received {:guess, "Is it 265"}
    assert_received {:guess, "Is it 273"}
  end
end
