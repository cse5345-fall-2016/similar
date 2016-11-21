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
    
    test "gives next clue" do
      "balloons Going Very low"
      |> as_word_list
      |> Enum.map(fn << x :: utf8, _ :: binary >> -> x end)
      |> List.to_string
      |> TH.next_branch
    end
  end

end
