defmodule Apiserver.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message()))
  end

  get "/api" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{text: "Is API"}))
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  defp message do
    %{
      response_type: "in_channel",
      text: "Hello from BOTAPI! :)"
    }
  end
end
