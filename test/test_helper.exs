ExUnit.start()

defmodule TH do

  def next_branch(name, decode \\ true) do

    decoded_name = if decode, do: :base64.decode(name), else: name

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
