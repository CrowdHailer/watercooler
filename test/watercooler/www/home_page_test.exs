defmodule Watercooler.WWW.HomePageTest do
  use ExUnit.Case

  alias Watercooler.WWW.HomePage

  test "returns the Raxx.Kit home page" do
    request = Raxx.request(:GET, "/")

    response = HomePage.handle_request(request, %{})

    assert response.status == 200
    assert response.headers == [{"content-type", "text/html"}, {"content-length", "667"}]
    assert String.contains?(response.body, "Watercooler")
  end
end
