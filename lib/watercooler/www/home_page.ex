defmodule Watercooler.WWW.HomePage do
  use Raxx.SimpleServer
  use Raxx.View,
  arguments: [:node],
  layout: "_layout.html.eex"

  @impl Raxx.SimpleServer
  def handle_request(_request, _state) do
    response(:ok)
    |> render(Node.self())
  end
end
