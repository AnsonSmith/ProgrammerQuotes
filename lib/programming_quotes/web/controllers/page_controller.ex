defmodule ProgrammingQuotes.Web.PageController do
  use ProgrammingQuotes.Web, :controller
  alias ProgrammingQuotes.Data.QuoteServer

  def index(conn, _params) do
    {:ok, %{author: author, line: pquote}} = QuoteServer.random_quote()
    conn
    |> assign(:author, author)
    |> assign(:pquote, pquote)
    |> render("index.html")
  end
end
