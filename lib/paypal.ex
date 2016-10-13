defmodule Paypal do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Paypal.Payments.Worker, [%{}]),
    ]

    opts = [strategy: :one_for_one, name: Paypal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
