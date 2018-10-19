defmodule UserApiWeb.Router do
  use UserApiWeb, :router

  pipeline :browser do
    plug :accepts, ["json"]
    #plug :accepts, ["html"]
    #plug :fetch_session
    #plug :fetch_flash
    #plug :protect_from_forgery
    #plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", UserApiWeb do
    pipe_through :api # Use the default browser stack
    resources "/users", UserController, only: [:index, :show, :create]
    #get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", UserApiWeb do
  #   pipe_through :api
  # end
end
