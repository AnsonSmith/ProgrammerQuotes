defmodule ProgrammingQuotes.Data.QuoteServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def random_quote() do
    GenServer.call(__MODULE__, :random_quote)
  end

  def init([]) do
    Process.send_after(self(), :load_quotes, 0)
    {:ok, []}
  end

  def handle_call(:random_quote, _from, quotes) do
    {:reply, {:ok, Enum.random(quotes)}, quotes}
  end

  def handle_info(:load_quotes, _state) do
    {:noreply, read_quotes_file()}
  end


  defp read_quotes_file() do
    :code.priv_dir(:programming_quotes) ++ '/quotes.txt'
    |> File.stream!()
    |> Enum.to_list
    |> Enum.map(fn(x) -> line_to_map(String.split(x, "\t")) end )

  end

  defp line_to_map([progquote, author]) do
    %{line: trim_data(progquote), author: trim_data(author)}
  end
  defp line_to_map(_other) do
    :invalid
  end

  defp trim_data(data) do
    data
    |> String.trim("\"")
    |> String.trim("\n")
  end
end
