defmodule Paypal.Payment do
  defstruct [:id, :intent, :payer, :transactions, :create_time, :update_time,
    :state, :note_to_payer, :redirect_urls, :links]
end
