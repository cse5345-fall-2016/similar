defmodule Similar.Ngrams do

  @doc """
  Normalize a string (downcasing it and removing nonword characters),
  and return a set of all word ngrams in the result of the given length:

      iex> import Similar.Ngrams
      iex> result = ngrams_in("ant bee cat dog elk", 3)
      iex> MapSet.equal? result, MapSet.new [ ~w/ant bee cat/, ~w/bee cat dog/, ~w/cat dog elk/  ]
      true

  """
  def ngrams_in(string, size \\ 2) do
    string
    |> normalize
    |> as_word_list
    |> Enum.chunk(size, 1)
    |> Enum.uniq
    |> Enum.into(MapSet.new)
  end

  def normalize(string) do
    string
    |> String.downcase
    |> String.codepoints
    |> Enum.map(fn ch -> if (ch < "a" || ch > "z"), do: " ", else: ch end)
    |> Enum.join
  end

  def as_word_list(string) do
    string
    |> String.split(" ", trim: true)
  end
  
end
