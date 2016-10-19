defmodule Paypal.Storage.Worker do
	use GenServer

	@name __MODULE__

	def start_link(table) do
		GenServer.start_link(@name, table, name: @name)
	end

	def init(table) do
		{:ok, table}
	end

	def read(key) do
		GenServer.call(@name, {:read, key})
	end

	def put(key, value) do
		GenServer.cast(@name, {:put, key, value})
	end

	def handle_call({:read, key}, _from, table) do
		case :ets.lookup(table, key) do
			[{_, value}]  -> {:reply, {:ok, value}, table}
			_ 						-> {:reply, {:error, "Not found"}, table}
		end
	end

	def handle_cast({:put, key, value}, table) do
		:ets.insert(table, {key, value})
		{:noreply, table}
	end
end
