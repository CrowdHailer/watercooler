defmodule Watercooler.WWW.HomePage do
  use Raxx.Server
  use Watercooler.WWW.HTMLView

  @impl Raxx.Server
  def handle_request(_request, _state) do
    response(:ok)
    |> render(%{node: Node.self()})
  end
end
