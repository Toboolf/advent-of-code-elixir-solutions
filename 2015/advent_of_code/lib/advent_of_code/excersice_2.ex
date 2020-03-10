defmodule ElvesWrappingRequest do
  
  defp wrapping_required(area1, area2, area3) do
    (2 * (area1 + area2 + area3)) + Enum.min [area1,area2,area3]
  end

  defp caculate_single_wrapping({l, w, h}), do: wrapping_required(l*w, l*h, w*h)

  defp start_wrapping(gift_list), do: do_wrapping(gift_list, 0)

  defp do_wrapping([], count), do: count
  defp do_wrapping([h | t], count), do: do_wrapping(t, count + caculate_single_wrapping(h))

  def request_wrapping(gift_sizes) do
    gift_sizes
    |> String.split()
    |> Enum.map( fn(gift_specs) -> Enum.map(String.split(gift_specs,"x"), fn(each_size) -> String.to_integer(each_size) end) |> List.to_tuple() end)
    |> start_wrapping()
  end

end