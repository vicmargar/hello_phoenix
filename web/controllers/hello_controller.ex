defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> put_layout(:awesome)
    |> render "show.html", messenger: messenger
  end
end
