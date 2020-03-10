defmodule ElvesWrappingRequest do
  
  defp to_list_of_ints(gift_sizes) do
    gift_sizes
    |> String.split()
    |> Enum.map( fn(single_gift) -> Enum.map(String.split(single_gift,"x"), fn(each_size) -> String.to_integer(each_size) end) end )
  end

  defp wrapping_required(area1, area2, area3) do
    (2 * (area1 + area2 + area3)) + Enum.min [area1,area2,area3]
  end

  defp caculate_single_wrapping({l, w, h}), do: wrapping_required(l*w, l*h, w*h)

  defp do_wrapping([], count), do: count
  defp do_wrapping([h | t], count), do: do_wrapping(t, count + caculate_single_wrapping(h))

  def request_wrapping(gift_sizes) do
    gift_sizes
    |> String.split()
    |> Enum.map( fn(gift_specs) -> Enum.map(String.split(gift_specs,"x"), fn(each_size) -> String.to_integer(each_size) end) |> List.to_tuple() end)
    |> do_wrapping(0)
  end

  defp min_perimeter(dimentions) do
    [a, b | _] = Enum.sort(dimentions)
    2*(a+b)
  end

  defp length_of_bow([l,w,h]), do: l * w * h

  def request_ribbon(gift_sizes) do
    gift_sizes
    |> to_list_of_ints()
    |> ribbon_gift(0)
  end

  defp ribbon_gift([], count), do: count
  defp ribbon_gift([h | t], count), do: ribbon_gift(t, count + min_perimeter(h) + length_of_bow(h))

end