defmodule Paypal.Payment do
  @derive [Poison.Encoder]
  defstruct [:id, :intent, :state, :payer, :transactions, :create_time, 
  :update_time, :state, :note_to_payer, :redirect_urls, :links]
end
