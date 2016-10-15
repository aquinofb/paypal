defmodule Paypal.PaymentOptions do
  @derive [Poison.Encoder]
  defstruct [:allowed_payment_method]
end
