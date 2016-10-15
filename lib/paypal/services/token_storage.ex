defmodule Paypal.Services.TokenStorage do
  def start_link(_type, _args) do
    Agent.start_link(fn -> %Paypal.Token{} end, name: :token)
  end

  def current do
    token = Agent.get(:token, &(&1))
    if expired?(token) do
      refresh
    else
      token
    end
  end

  def update(token) do
    Agent.update(:token, fn _ -> 
      %{token | expires_in: token.expires_in + :os.system_time(:milli_seconds)}  
    end)
    Agent.get(:token, &(&1))
  end

  def refresh do 
    Paypal.Services.Authorization.authorize
    |> update
  end

  def expired?(%Paypal.Token{expires_in: expires_in}) when is_nil(expires_in),
    do: true

  def expired?(%Paypal.Token{expires_in: expires_in}),
    do: :os.system_time(:milli_seconds) >= expires_in
end