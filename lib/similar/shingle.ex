defmodule Similar.Shingle do

  import Similar.Ngrams, only: [ ngrams_in: 2 ]

  def similarity(named_strings, ngram_size) do
    ngrams_for_strings = Enum.map(named_strings, fn [name, string] ->
      {name, ngrams_in(string, ngram_size) }
    end)

    for {name1, ngrams1} <- ngrams_for_strings,
                  {name2, ngrams2} <- ngrams_for_strings,
                  name1 < name2 do
      { name1, name2, jaccard(ngrams1, ngrams2) }
    end
  end

  # see https://en.wikipedia.org/wiki/Jaccard_index
  def jaccard(set1, set2) do
    import Set
    size(intersection(set1, set2)) / size(union(set1, set2))
  end
end
