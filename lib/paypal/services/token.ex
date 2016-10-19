defmodule Paypal.Services.Token do
  alias Paypal.Services.Authorization
  alias Paypal.Token

  @table_key :token

  def current do
    {:ok, token} = Paypal.Storage.Worker.read(@table_key)
    if expired?(token) do
      refresh
    else
      token
    end
  end

  def update(token) do
    token = %{token | expires_in: token.expires_in + :os.system_time(:milli_seconds)}
    case Paypal.Storage.Worker.put(@table_key, token) do
      :ok -> token
      :error -> nil
    end
  end

  def refresh do 
    Authorization.authorize
    |> update
  end

  def expired?(%Token{expires_in: expires_in}) when is_nil(expires_in),
    do: true

  def expired?(%Token{expires_in: expires_in}),
    do: :os.system_time(:milli_seconds) >= expires_in
end
