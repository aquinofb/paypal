defmodule Paypal.TransactionFee do
  @derive [Poison.Encoder]
  defstruct [:value, :currency]
end
