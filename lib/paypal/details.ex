defmodule Paypal.Details do
  @derive [Poison.Encoder]
  defstruct [:subtotal, :tax, :shipping, :handling_fee,
    :shipping_discount, :insurance]
end
