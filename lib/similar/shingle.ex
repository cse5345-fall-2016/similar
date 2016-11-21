defmodule Similar.Shingle do

  import Similar.Ngrams, only: [ ngrams_in: 2 ]

  def similarity(named_strings, ngram_size) do
    lists_of_ngrams(named_strings, ngram_size)
    |> score_cross_product
  end

  def lists_of_ngrams(named_strings, ngram_size) do
    Enum.map(named_strings, fn [name, string] ->
      Task.async(fn -> {name, ngrams_in(string, ngram_size)} end)
    end)
    |> Enum.map(&Task.await/1)
  end

  def score_cross_product(lists_of_ngrams) do
    for {name1, ngrams1} <- lists_of_ngrams,
        {name2, ngrams2} <- lists_of_ngrams,
        name1 < name2
    do
      { name1, name2, jaccard(ngrams1, ngrams2) }
    end
  end

  # see https://en.wikipedia.org/wiki/Jaccard_index
  def jaccard(set1, set2) do
    import Set
    size(intersection(set1, set2)) / size(union(set1, set2))
  end
end
