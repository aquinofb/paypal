defmodule Paypal.Storage.Supervisor do
	use Supervisor

	@name __MODULE__

	def start_link(table_name) do
		Supervisor.start_link(__MODULE__, table_name, [name: @name])
	end

	def init(table_name) do
		table = :ets.new(table_name, [:set, :public])

    children = [
      worker(Paypal.Storage.Worker, [table])
    ]

    supervise(children, strategy: :one_for_one)
	end
end
