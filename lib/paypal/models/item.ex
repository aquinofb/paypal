defmodule Paypal.Item do
  @derive [Poison.Encoder]
  defstruct [:name, :description, :quantity, :price,
    :tax, :sku, :currency]
end
