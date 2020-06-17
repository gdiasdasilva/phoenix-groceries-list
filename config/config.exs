# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :groceries_list,
  ecto_repos: [GroceriesList.Repo]

# Configures the endpoint
config :groceries_list, GroceriesListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+TgU8HY1j+boLp5viW/PhKw2QsCiYP6in002t+udkodJ7A4UElVklwzSbWGBav/m",
  render_errors: [view: GroceriesListWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GroceriesList.PubSub,
  live_view: [signing_salt: "TsmjUj3f"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
