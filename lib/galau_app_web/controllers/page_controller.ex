defmodule GalauAppWeb.PageController do
  use GalauAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
