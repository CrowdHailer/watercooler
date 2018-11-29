defmodule Watercooler.WWW.NotFoundPage do
  use Raxx.SimpleServer
  use Watercooler.WWW.HTMLView

  @impl Raxx.SimpleServer
  def handle_request(_request, _state) do
    response(:not_found)
    |> render(%{})
  end
end
