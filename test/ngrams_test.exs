defmodule NGramsTest do
  use ExUnit.Case
  import Similar.Ngrams

  describe "normalize" do

    test "converts to lower case" do
      assert normalize("NowIsTheTime") == "nowisthetime"
    end

    test "preserves spaces" do
      assert normalize("Now Is  The Time") == "now is  the time"
    end

    test "replaces nonletters with spaces" do
      input  = "'No!' said Jack. 'I will not!'"
      result = " no   said jack   i will not  "
      assert normalize(input) == result
    end

  end

  describe "as_word_list" do
    test "empty string" do
      assert as_word_list("") == []
    end

    test "just spaces" do
      assert as_word_list("  ") == []
    end

    test "one word" do
      assert as_word_list("cat") == [ "cat" ]
    end

    test "one word with spaces" do
      assert as_word_list("  cat ") == [ "cat" ]
    end

    test "two words with spaces" do
      assert as_word_list("  bee     cat") == [ "bee",  "cat" ]
    end
    
  end

  describe "ngrams" do

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

    test "gives next clue" do
      "a rose is a rose is a rose"
      |> ngrams_in(2)
      |> MapSet.size
      |> (&"x#{&1}").()
      |> TH.next_branch(false)
    end
  end

end
