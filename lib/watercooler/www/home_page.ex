defmodule Watercooler.WWW.HomePage do
  use Raxx.SimpleServer
  use Watercooler.WWW.HTMLView

  @impl Raxx.SimpleServer
  def handle_request(_request, _state) do
    response(:ok)
    |> render(%{node: Node.self()})
  end
end
