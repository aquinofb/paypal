defmodule Paypal.PayerInfo do
  @derive [Poison.Encoder]
  defstruct [:email, :first_name, :last_name, :payer_id, :shipping_address]
end