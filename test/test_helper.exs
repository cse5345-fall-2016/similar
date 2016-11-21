ExUnit.start()

defmodule TH do

  def next_branch(_name, decode \\ true) do

    decoded_name = if decode, do: :base64.decode(name), else: name

    msg = """

    Congratulations!

    Have a look at the readme for some ideas.

    """

    IO.puts msg

  end
end
