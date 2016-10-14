defmodule Paypal.Transaction do
  defstruct [:amount, :description, :custom, :invoice_number,
    :payment_options, :soft_descriptor, :item_list, :shipping_address]
end
