defmodule Blog.Admin.UserController do
  use Blog.Web, :controller

  alias Blog.User

  plug :scrub_params, "user" when action in [:create, :update]

  def index(conn, _params) do
    users = Repo.paginate(User, _params)
    render(conn, "index.html", users: users)
  end

end
