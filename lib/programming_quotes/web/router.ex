defmodule ProgrammingQuotes.Web.Router do
  use ProgrammingQuotes.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProgrammingQuotes.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", ProgrammingQuotes.Web do
    pipe_through :api

    get "/random", QuotesController, :random
   end
end
