defmodule NGramsTest do
  use ExUnit.Case
  import Similar.Ngrams, only: [ ngrams_in: 1, ngrams_in: 2 ]

  test "empty engrams" do
    assert MapSet.equal?(ngrams_in(""), MapSet.new)
  end

  test "engrams of length 2" do
    assert ngrams_in("a b c", 2) == MapSet.new([["a","b"], ["b","c"]])
  end
  
  test "engrams of length 3" do
    assert ngrams_in("a b c", 3) == MapSet.new([["a","b","c"]])
  end

  test "downcasing works" do
    assert ngrams_in("a B C", 3) == MapSet.new([["a","b","c"]])
  end


  test "nonword characters removed" do
    input = ~S{"Hello," said Mary.}
    result = [ ["hello", "said"], ["said", "mary"] ]
    assert ngrams_in(input) == MapSet.new(result)
  end
end
