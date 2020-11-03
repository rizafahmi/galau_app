defmodule GalauAppWeb.SessionController do
  use GalauAppWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case(GalauApp.Accounts.authenticate_with_email_and_password(email, password)) do
      {:ok, user} ->
        conn
        |> GalauAppWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.question_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid email or password")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> GalauAppWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
