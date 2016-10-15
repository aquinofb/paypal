defmodule Paypal.Services.Authorization do
  @url            Application.get_env(:paypal, :url)
  @client_id      Application.get_env(:paypal, :client_id)
  @client_secret  Application.get_env(:paypal, :client_secret)

  def authorize do
    @url <> "oauth2/token"
    |> HTTPoison.post("grant_type=client_credentials", 
                      basic_headers, 
                      hackney_credentials)
    |> parse_response
  end

  defp hackney_credentials do
    [ hackney: [ basic_auth: {@client_id, @client_secret} ] ]
  end

  defp parse_response(response) do
    case response do
      {:ok, %HTTPoison.Response{body: body}} -> Poison.decode!(body, as: %Paypal.Token{})
      _ -> :error 
    end
  end

  defp basic_headers,
    do: [{"Accept", "application/json"},
         {"Content-Type", "application/x-www-form-urlencoded"}]
end
