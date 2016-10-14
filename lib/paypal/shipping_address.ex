defmodule Paypal.ShippingAddress do
  defstruct [:recipient_name, :line1, :line2, :city,
    :country_code, :postal_code, :phone, :state]
end
