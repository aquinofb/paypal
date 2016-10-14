defmodule Paypal.Item do
  defstruct [:name, :description, :quantity, :price,
    :tax, :sku, :currency]
end
