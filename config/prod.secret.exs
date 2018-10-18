use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :user_api, UserApiWeb.Endpoint,
  secret_key_base: "yBf1JycJwYiSI9vWM5lLSZwlntdWWVKU8s93Huc08cc0U5fRdKuEP3VqLGt9Ec5T"

# Configure your database
config :user_api, UserApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "user_api_prod",
  pool_size: 15
