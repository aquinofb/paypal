defmodule Paypal.RedirectUrls do
  @derive [Poison.Encoder]
  defstruct [:return_url, :cancel_url]
end
