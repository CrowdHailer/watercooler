defmodule Watercooler.WWW.Publish do
  use Raxx.Server

  @impl Raxx.Server
  def handle_request(request, _state) do
    %{"message" => message} =
      request.body # 1.
      |> URI.decode_www_form()
      |> URI.decode_query()

    {:ok, _} = Watercooler.publish(message) # 2.

    redirect("/") # 3.
  end
end
