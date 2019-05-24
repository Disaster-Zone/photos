# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :ex_aws,
  access_key_id: ["ACCESS_KEY", System.get_env("CG_MEETUP_S3_ACCESS_KEY_ID")],
  secret_access_key: ["SECRET_ACCESS_KEY", System.get_env("CG_MEETUP_S3_SECRET_ACCESS_KEY")]

config :logger, :console, format: "[$level] $message\n"
