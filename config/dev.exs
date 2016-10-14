use Mix.Config

config :paypal, 
  url: "https://api.sandbox.paypal.com/v1/",
  client_id:      System.get_env("PAYPAL_CLIENT_ID"),
  client_secret:  System.get_env("PAYPAL_CLIENT_ID")
