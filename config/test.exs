import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kv, Kv.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "kv_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kv_web, KvWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "KejW+NLQwaf+aq3GuSMLnLFAa5ZPXA0laqkfnzwsnKcUdZiCBAkYxrnZ75vjSrQA",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :kv, Kv.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
