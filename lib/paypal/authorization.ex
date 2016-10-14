defmodule Paypal.Authorization do
  @derive [Poison.Encoder]
  defstruct [:access_token, :token_type, :app_id, :expires_in]
end
