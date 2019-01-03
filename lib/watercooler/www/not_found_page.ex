defmodule Watercooler.WWW.NotFoundPage do
  use Raxx.SimpleServer

  use Raxx.View,
    arguments: [],
    layout: "_layout.html.eex"

  @impl Raxx.SimpleServer
  def handle_request(_request, _state) do
    response(:not_found)
    |> render()
  end
end
