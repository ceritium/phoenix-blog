# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :blog, Blog.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Mh5mSGF1Dkni9YPPq2Yj327FZ6Ya2oY6tdL00DR8cpC3mwfZMLUuu8BeuEy8B+6b",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Blog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :scrivener_html,
  routes_helper: Blog.Router.Helpers

config :addict,
  secret_key: "2432622431322438736c6470734f384875766c586953434573564c7775",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: Blog.User,
  repo: Blog.Repo,
  from_email: "no-reply@example.com", # CHANGE THIS
mail_service: nil