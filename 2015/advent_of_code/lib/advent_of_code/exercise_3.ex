defmodule Advent_of_code.Houses_in_a_vacuum do

  def deliver_gifts_in_grid(instructions) do
    instructions
    |> String.split("", trim: true)
    |> follow_instrucctions({0, 0}, [{0, 0}])
    |> Enum.uniq
    |> Enum.count
  end

  defp follow_instrucctions([], _, steps_followed), do: steps_followed

  defp follow_instrucctions([next | instructions], current_coord, steps_followed) do
    next_coord = next_move(next, current_coord)
    follow_instrucctions(instructions, next_coord, [next_coord | steps_followed])
  end

  defp next_move("^", {x, y}), do: {x, y + 1}
  defp next_move("v", {x, y}), do: {x, y - 1}
  defp next_move(">", {x, y}), do: {x + 1, y}
  defp next_move("<", {x, y}), do: {x - 1, y}
  defp next_move(_, coord), do: coord


  def deliver_gifts_in_grid_with_robo_santa(instructions) do
    instructions
    |> String.split("", trim: true)
    |> follow_instrucctions({0, 0}, {0, 0}, [])
    |> Enum.uniq
    |> Enum.count
  end

  defp follow_instrucctions([], santas_position, robos_position, steps_followed), do: [santas_position, robos_position | steps_followed]

  defp follow_instrucctions([santas_next | []], santas_position, robos_position, steps_followed) do
    follow_instrucctions(
      [],
      next_move(santas_next, santas_position),
      robos_position,
      [santas_position, robos_position | steps_followed]
    )
  end

  defp follow_instrucctions([santas_next, robos_next | instructions], santas_position, robos_position, steps_followed) do
    follow_instrucctions(
      instructions,
      next_move(santas_next, santas_position),
      next_move(robos_next, robos_position),
      [santas_position, robos_position | steps_followed]
    )
  end

end
