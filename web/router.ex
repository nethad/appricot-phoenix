defmodule Appricot.Router do
  use Appricot.Web, :router

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

  scope "/", Appricot do
    pipe_through :api

    resources "/projects", ProjectController, only: [:show]
    resources "/users", UserController, only: [:index]
  end

end
