defmodule ProgrammingQuotes.Web.QuotesController do
  use ProgrammingQuotes.Web, :controller
  alias ProgrammingQuotes.Data.QuoteServer


  def random(conn, _params) do
    {:ok, prog_quote} = QuoteServer.random_quote()
    conn
    |> json(prog_quote)
  end
end
