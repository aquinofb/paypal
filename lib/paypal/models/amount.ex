defmodule Paypal.Amount do
  @derive [Poison.Encoder]
  defstruct [:total, :currency, :details]
end
