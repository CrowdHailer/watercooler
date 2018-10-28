defmodule Watercooler.WWW.NotFoundPage do
  use Raxx.Server, type: :simple
  use Watercooler.WWW.HTMLView

  @impl Raxx.SimpleServer
  def handle_request(_request, _state) do
    response(:not_found)
    |> render(%{})
  end
end
