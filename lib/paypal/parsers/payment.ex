defmodule Paypal.Parsers.Payment do
  @struct %Paypal.Payment{
            payer: %Paypal.Payer{
              payer_info: %Paypal.PayerInfo{
                shipping_address: %Paypal.ShippingAddress{}
              }
            },
            transactions: [
              %Paypal.Transaction{
                amount: %Paypal.Amount{
                  details: %Paypal.Details{}
                },
                item_list: %Paypal.ItemList{
                  items: [%Paypal.Item{}]
                },
                shipping_address: %Paypal.ShippingAddress{},
                related_resources: [%Paypal.Sale{
                  amount: %Paypal.Amount{},
                  transaction_fee: %Paypal.TransactionFee{},
                  links: [%Paypal.Link{}]
                }]
              }
            ],
            redirect_urls: %Paypal.RedirectUrls{}
          }

  def compact(struct) when is_map(struct) do
    struct 
    |> Map.from_struct 
    |> Enum.filter(fn {_, v} -> v != nil end)
    |> Enum.map(fn {k, v} -> {k, compact(v)} end)
    |> Enum.into(%{})
  end

  def compact(struct) when is_list(struct) do
    struct
    |> Enum.map(fn (e) -> compact(e) end)
    |> List.flatten
  end

  def compact(struct), do: struct

  def decode!(json), do: Poison.decode!(json, as: @struct)

  def encode!(payment) do
    payment
    |> compact
    |> Poison.encode!
  end
end
