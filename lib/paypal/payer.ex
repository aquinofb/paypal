defmodule Paypal.Payer do
  @derive [Poison.Encoder]
  defstruct [:payment_method, :payer_info]
end
