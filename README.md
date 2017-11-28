# Great job!

Here's the big one. Given these two helpers, we now need to take our
list of words and convert it into a set containing all the unique ngrams
of a given length. 

An ngram is a sequence of n consecutive words from the list. So, given

    "ant bee cat dog ant bee"

and a size of 2, we'd want a set containing

    [ ["ant", "bee"], ["bee", "cat"], ["cat", "dog"], ["dog", "ant" ]

Write the function `Similar.Ngrams.ngrams_in` that does this. it takes
the string and the ngram size, and returns a MapSet.

The function Enum.chunk_every is your friend.

You'll know you're done when the tests pass.

