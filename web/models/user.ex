defmodule Blog.User do
  @moduledoc """
    User is the admin of the blog.
  """

  use Blog.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email), [])
    |> validate_length(:email, min: 1, max: 20)
    |> unique_constraint(:email)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(change) do
    case changes do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(change, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        change
    end
  end
end
