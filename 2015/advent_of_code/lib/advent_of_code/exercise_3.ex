defmodule Advent_of_code.Houses_in_a_vacuum do

    def deliver_gifts_in_grid(instructions) do
        instructions
        |> String.split("")
        |> follow_instrucctions({0, 0}, [])
        |> Enum.uniq
        |> Enum.count
    end

    def follow_instrucctions([], _, steps_followed) do 
        steps_followed
    end

    def follow_instrucctions([next | instructions], current_coord, steps_followed) do 
        follow_instrucctions(instructions, next_move(next, current_coord), [current_coord | steps_followed])
    end

    def of(n), do: compute(n, 1)
    defp compute(1, accum), do: accum
    defp compute(n, accum), do: compute(n-1, accum * n)

    def next_move("^", {x, y}), do: {x, y + 1}
    def next_move("v", {x, y}), do: {x, y - 1}
    def next_move(">", {x, y}), do: {x + 1, y}
    def next_move("<", {x, y}), do: {x - 1, y}
    def next_move(_, coord), do: coord

end