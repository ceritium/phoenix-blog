defmodule Blog.Router do
  use Blog.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :addict_routes do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug :put_layout, {Addict.AddictView, "addict.html"}

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :addict_routes
    addict :routes
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "admin", Admin, as: :admin do
      resources "/posts", PostController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blog do
  #   pipe_through :api
  # end
end
