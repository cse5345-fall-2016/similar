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

    test "gives next clue" do

      "yX.zdgVU"
      |> normalize
      |> String.upcase
      |> String.replace("ZD", "zd")
      |> String.replace("U", "u")
      |> String.replace(" ", "V")
      |> TH.next_branch
    end
  end
end
