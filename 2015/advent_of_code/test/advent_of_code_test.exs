defmodule AdventOfCodeTest do
  use ExUnit.Case
  doctest Advent_of_code.Houses_in_a_vacuum

  test "> deliver gifts in grid" do
    assert Advent_of_code.Houses_in_a_vacuum.deliver_gifts_in_grid(">") == 2
  end

  test ">> deliver gifts in grid" do
    assert Advent_of_code.Houses_in_a_vacuum.deliver_gifts_in_grid(">>") == 3
  end

  test "><>< deliver gifts in grid" do
    assert Advent_of_code.Houses_in_a_vacuum.deliver_gifts_in_grid("><><") == 2
  end
end
