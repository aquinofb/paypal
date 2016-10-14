defmodule Paypal.Sale do
  @derive [Poison.Encoder]
  defstruct [:id, :create_time, :update_time, :amount, :payment_mode, 
    :state, :protection_eligibility, :protection_eligibility_type, 
    :transaction_fee, :value, :currency, :parent_payment, :links]
end
