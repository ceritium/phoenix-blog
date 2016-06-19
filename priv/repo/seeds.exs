# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Blog.Repo
alias Blog.Post
alias Blog.User

Faker.start

create_post = fn(_) ->
  Repo.insert!(%Post{
    title: Faker.Lorem.Shakespeare.hamlet,
    content: Faker.Lorem.paragraph(%Range{first: 5, last: 10})
  })
end

Enum.each 1..100, create_post

registration_changeset = User.registration_changeset(%User{},
  %{email: "ceritium@gmail.com", password: "123456"}
)
Repo.insert!(registration_changeset)
