defmodule Similar.Ngrams do

  @non_word_chars ~r/[^a-z]/


  def normalize(string) do
    string
    |> String.downcase
    |> String.replace(@non_word_chars, " ")
  end

  def as_word_list(string) do
    # your code
  end

end
