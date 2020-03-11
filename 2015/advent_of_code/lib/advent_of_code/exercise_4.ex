defmodule AdventCoinsMining do
  
  defp md5(message), do: Base.encode16(:erlang.md5(message))

  defp compare_hash(<<48,48,48,48,48, _::binary>>, _, number), do: number - 1
  defp compare_hash(_, prefix, number), do: compare_hash(md5( prefix <> Integer.to_string(number) ), prefix, number + 1)

  def find_number_to_start_mining(prefix), do: compare_hash("", prefix, 0)

end