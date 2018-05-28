defmodule Watercooler do
  @group :watercooler

  def publish(message) do
    :ok = :pg2.create(@group)
    for client <- :pg2.get_members(@group) do
      send(client, {@group, message})
    end

    {:ok, message}
  end

  def listen() do
    :ok = :pg2.create(@group)
    :ok = :pg2.join(@group, self())
    {:ok, @group}
  end
end
