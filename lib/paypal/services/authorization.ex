defmodule Paypal.Services.Authorization do
  alias Paypal.Authorization



  def authorize do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.post(@paypal_url <> "/oauth2/token",
      "grant_type=client_credentials", basic_headers, [ hackney: [basic_auth: {@client_id, @client_secret}]])
    Poison.decode!(body, as: %Authorization{})
  end

  defp basic_headers,
    do: [{"Accept", "application/json"},
         {"Content-Type", "application/x-www-form-urlencoded"}]
end
