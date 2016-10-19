defmodule Paypal.Services.Payment do
  @url Application.get_env(:paypal, :url)

  def create(payment),
    do: do_post(@url <> "payments/payment", 
          Poison.encode!(payment))

  def find(%Paypal.Payment{id: id}), 
    do: do_get(@url <> "payments/payment/#{id}")

  def execute(%Paypal.Payment{id: id}, payer_id),
    do: do_post(@url <> "payments/payment/#{id}/execute", 
          Poison.encode!(%{payer_id: payer_id}))

  defp do_post(url, params) do
    url
    |> HTTPoison.post(params, headers)
    |> parse_response
  end

  defp do_get(url) do
    url
    |> HTTPoison.get(url, headers)
    |> parse_response
  end

  defp parse_response(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body}} -> Poison.decode!(body, as: %Paypal.Payment{})
      _ -> :error
    end
  end

  defp headers do
    [{"Accept", "application/json"},
     {"Content-Type", "application/json"},
     {"Authorization", "Bearer #{Paypal.Services.Token.current.access_token}"}]
  end
end
