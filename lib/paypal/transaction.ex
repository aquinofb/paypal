defmodule Paypal.Transaction do
  @derive [Poison.Encoder]
  defstruct [:amount, :description, :custom, :invoice_number, :shipping_address,
    :payment_options, :soft_descriptor, :item_list, :related_resources]
end
