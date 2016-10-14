defmodule Paypal.ItemList do
  @derive [Poison.Encoder]
  defstruct [:items]
end
