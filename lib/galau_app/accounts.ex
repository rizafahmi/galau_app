defmodule GalauApp.Accounts do
  alias GalauApp.Accounts.User

  def list_users do
    [
      %User{id: 1, email: "rizafahmi@gmail.com"},
      %User{id: 2, email: "oranglain@gmail.com"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn user -> user.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn user ->
      Enum.all?(params, fn {key, val} -> Map.get(user, key) == val end)
    end)
  end
end
