# You made it!

I've added the support code to drive all this. Have a look at

lib/similar.ex:
  loads the files and passes them to the shingle algorithm

lib/similar/shingle.ex:
  the code that calculates the similarities between each pair of input
  files.

Run the code with

    mix run "Similar.books(«size»)"

where «size» is the shingle size. A size of one effectively just looks at word
usage, and a size of 2 looks at digrams (how often one word follows another).

You'll get output that looks like this:

    {"2", "8", 0.18773870452919486}
    {"5", "8", 0.17754625542017383}
    {"2", "5", 0.17650412337694252}
    {"1", "4", 0.16067968790909568}
    {"1", "7", 0.15279465370595383}
    {"4", "7", 0.14451254311307413}
    {"3", "9", 0.10509340338587274}
    {"6", "9", 0.10388531584710457}
    {"3", "6", 0.0988167988558055}

The first two fields are the names of the files containing the book
text, and the last is the similarity index (the bigger, the more
the two texts are similar).

Play around with different values of the ngram size.

With any luck you'll see three groups of three in the output. So, in
the above, you'll see 2, 5, and 8 are a group, as are 1, 4, and 7.

Have a look at the corresponding files in texts/ and see if we've
correctly identified books written by the same author.

If you have time, try adding more texts, from various sources.
