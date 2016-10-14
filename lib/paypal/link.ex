defmodule Paypal.Link do
  @derive [Poison.Encoder]
  defstruct [:href, :rel, :method]
end
