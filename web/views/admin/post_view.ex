defmodule Blog.Admin.PostView do
  use Blog.Web, :view
  alias Blog.Post
  import Scrivener.HTML
  import Phoenix.HTML.SimplifiedHelpers.Truncate

  def truncated_title(%Post{title: title}) do
    title
    |> truncate(length: 80)
  end
end
