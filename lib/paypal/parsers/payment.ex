defmodule Paypal.Parsers.Payment do
  alias Paypal.Payment
  alias Paypal.Transaction
  alias Paypal.Amount
  alias Paypal.Details
  alias Paypal.ItemList
  alias Paypal.Item
  alias Paypal.ShippingAddress
  alias Paypal.RedirectUrls

  @struct %Payment{
            transactions: [
              %Transaction{
                amount: %Amount{
                  details: %Details{}
                },
                item_list: %ItemList{
                  items: [%Item{}]
                },
                shipping_address: %ShippingAddress{}
              }
            ],
            redirect_urls: %RedirectUrls{}
          }

  def parse(json), do: Poison.decode(json, as: @struct)
end
