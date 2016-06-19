defmodule Blog.PostController do
  use Blog.Web, :controller

  alias Blog.Post

  def index(conn, _params) do
    posts = Repo.paginate(Post, _params)
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.html", post: post)
  end
end
