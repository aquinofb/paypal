defmodule Paypal.Details do
  defstruct [:subtotal, :tax, :shipping, :handling_fee,
    :shipping_discount, :insurance]
end
