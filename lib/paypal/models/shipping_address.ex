defmodule Paypal.ShippingAddress do
  @derive [Poison.Encoder]
  defstruct [:recipient_name, :line1, :line2, :city,
    :country_code, :postal_code, :phone, :state]
end
