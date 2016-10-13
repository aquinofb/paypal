defmodule Paypal.Payments.Worker do
  use GenServer

  def start_link(config, opts \\ [name: __MODULE__]) do
    GenServer.start_link(__MODULE__, config, opts)
  end

  def init(config) do
    {:ok, config}
  end

  def payment(params) do
    GenServer.call(__MODULE__, {:payment, params})
  end

  def checkout(params) do
    GenServer.call(__MODULE__, {:checkout, params})
  end


  def handle_call({:payment, params}, _from, config) do
    response = Paypal.Payments.Service.create_payment(params, config)
    {:reply, response, config}
  end

  def handle_call({:checkout, params}, _from, config) do
    response = Paypal.Payments.Service.create_checkout(params, config)
    {:reply, response, config}
  end
end
