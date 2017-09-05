defmodule ProgrammingQuotes.Web.PageControllerTest do
  use ProgrammingQuotes.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Programmer Quotes"
  end
end
