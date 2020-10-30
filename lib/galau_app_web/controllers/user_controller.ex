defmodule GalauAppWeb.UserController do
  use GalauAppWeb, :controller
  alias GalauApp.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(String.to_integer(id))
    render(conn, "show.html", user: user)
  end
end
