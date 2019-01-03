defmodule Watercooler.WWW.Listen do
  use Raxx.Server, type: :streaming
  alias ServerSentEvent, as: SSE

  @impl Raxx.Server
  def handle_head(_request, state) do
    # 1.
    {:ok, _} = Watercooler.listen()

    response =
      response(:ok)
      |> set_header("content-type", SSE.mime_type())
      # 2.
      |> set_body(true)

    # 3.
    {[response], state}
  end

  @impl Raxx.Server
  def handle_info({:watercooler, message}, state) do
    event = SSE.serialize(message)
    # 4.
    {[Raxx.data(event)], state}
  end
end
