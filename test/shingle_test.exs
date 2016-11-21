defmodule ShingleTest do
  use ExUnit.Case
  import Similar.Shingle, only: [ similarity: 2 ]

  @one             [:one, "now is"]
  @same_as_one     [:two, "now is"]
  @not_same_as_one [:two, "the time"]
  @similar_to_one  [:two, "it is"]

  @three [:three, "a b c"]
  @four  [:four,  "x b c"]
  @five  [:five,  "x b a b"]

  test "empty input" do
    assert similarity([], 2) == []
  end

  test "single input produces no output" do
    assert similarity([@one], 2) == []
  end

  test "two identical strings produce a score of 1" do
    assert similarity([@one, @same_as_one], 2) == [ {:one, :two, 1.0}]
  end

  test "two different strings produce a score of 0" do
    assert similarity([@one, @not_same_as_one], 2) == [ {:one, :two, 0.0}]
  end
  
  test "partially different strings with no common ngrams produce a score of 0" do
    assert similarity([@one, @similar_to_one], 2) == [ {:one, :two, 0}]
  end

  test "one of three total engrams match" do
    assert similarity([@three, @four], 2) == [ {:four, :three, 1/3}]
  end

  test "one of  total engrams match" do
    result = [{:four, :three, 1/3},
              {:five, :three, 1/4},
              {:five, :four,  1/4}]

    assert similarity([@three, @four, @five], 2) == result
  end
  

end
