defmodule Similar do
  def books(ngram_size \\ 2) do
    Path.wildcard("texts/*.txt")
    |> Enum.map(&name_and_contents/1)
    |> Similar.Shingle.similarity(ngram_size)
    |> Enum.sort_by(fn {_n1, _n2, score} -> -score end)
    |> Enum.take(9)
    |> Enum.each(&IO.inspect/1)
  end

  defp name_and_contents(path) do
    [ Path.basename(path, ".txt"), File.read!(path) ]
  end
end
