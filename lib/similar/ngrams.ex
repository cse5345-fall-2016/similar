defmodule Similar.Ngrams do

  @non_word_chars ~r/[^a-z]/


 def ngrams_in(string, size \\ 2) do
    string
    |> normalize
    |> as_word_list
    # your code...
 end


  def normalize(string) do
    string
    |> String.downcase
    |> String.replace(@non_word_chars, " ")
  end

  def as_word_list(string) do
    string
    |> String.split(" ", trim: true)
  end

end
