defmodule Paypal.Token do
  @derive [Poison.Encoder]
  defstruct [:access_token, :expires_in]
end
