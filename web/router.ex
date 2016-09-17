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

    get "/", RootController, :index

    resources "/projects", ProjectController, only: [:show, :index, :create, :update] do
      resources "/environments", EnvironmentController, only: [:show, :index, :create, :update]
    end
    resources "/users", UserController, only: [:index, :show]
  end

end
