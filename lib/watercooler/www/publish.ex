defmodule Watercooler.WWW.Publish do
  use Raxx.SimpleServer

  @impl Raxx.SimpleServer
  def handle_request(request, _state) do
    # 1.
    %{"message" => message} =
      request.body
      |> URI.decode_www_form()
      |> URI.decode_query()

    # 2.
    {:ok, _} = Watercooler.publish(message)

    # 3.
    redirect("/")
  end
end
