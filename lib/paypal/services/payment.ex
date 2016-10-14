defmodule Paypal.Services.Payment do
  alias Paypal.Payment
  alias Paypal.Transaction
  alias Paypal.Amount
  alias Paypal.ItemList
  alias Paypal.Item
  alias Paypal.ShippingAddress
  alias Paypal.RedirectUrls
  alias Paypal.Payer
  alias Paypal.PaymentOptions

  @ie %Payment{
        intent: "sale",
        payer: %Payer{
          payment_method: "paypal"
        },
        transactions: [
          %{
            amount: %{
              total: "30.11",
              currency: "EUR"
            },
            description: "Description...",
            item_list: %ItemList{
              items: [
                %Item{
                  name: "Galway Bay",
                  description: "We Craft Beer",
                  quantity: 1,
                  price: "30.11",
                  currency: "EUR"
                }
              ]
            }
          }
        ],
        redirect_urls: %RedirectUrls{
          return_url: "http://www.amazon.com",
          cancel_url: "http://www.hawaii.com"
        }
      }

  @paypal_url "https://api.sandbox.paypal.com/v1"

  def create do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(@paypal_url <> "/payments/payment",
      Poison.encode!(@ie), headers)
    Paypal.Parsers.Payment.parse(body)
  end

  def paypay, do: @ie

  def headers do
    [{"Accept", "application/json"},
     {"Content-Type", "application/json"},
     {"Authorization", "Bearer "}]
  end

end
