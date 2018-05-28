defmodule Watercooler.WWW.Listen do
  use Raxx.Server
  alias ServerSentEvent, as: SSE

  @impl Raxx.Server
  def handle_request(_request, state) do
    {:ok, _} = Watercooler.listen() # 1.

    response = response(:ok)
    |> set_header("content-type", SSE.mime_type())
    |> set_body(true) # 2.

    {[response], state} # 3.
  end

  @impl Raxx.Server
  def handle_info({:watercooler, message}, state) do
    event = SSE.serialize(message)
    {[Raxx.data(event)], state} # 4.
  end
end
