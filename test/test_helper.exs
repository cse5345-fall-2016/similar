ExUnit.start()

defmodule TH do

  def next_branch(name) do

    decoded_name = :base64.decode(name)

    msg = """

    Congratulations! You're ready for the next challenge.

    Use the following two commands to start (if you dare...)

        git stash

        git checkout #{decoded_name}

    Then have a look at the readme.

    Good luck!

    """

    IO.puts msg

  end
end
