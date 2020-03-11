defmodule SantasFloorMapping do

    def read_santas_map(string) do
        string
        |> String.split("")
        |> count_next(0, -1)
    end

    def count_next([], count, _), do: count
    def count_next([h | t], count, index) when count == -1 do
        IO.inspect "Santa's in the basement at instruction #{index}"
        count_next(t, count + upstairs_downstairs(h), index + 1)
    end
    def count_next([h | t], count, index), do: count_next(t, count + upstairs_downstairs(h), index + 1)

    def upstairs_downstairs("("), do: 1
    def upstairs_downstairs(")"), do: -1
    def upstairs_downstairs(""), do: 0

end