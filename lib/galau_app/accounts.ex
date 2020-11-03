defmodule GalauApp.Accounts do
  alias GalauApp.Accounts.User
  alias GalauApp.Repo

  def list_users do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def change_registration(%User{} = user, attrs) do
    User.registration_changeset(user, attrs)
  end

  def authenticate_with_email_and_password(email, given_password) do
    user = get_user_by(email: email)

    cond do
      user && Pbkdf2.verify_pass(given_password, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end
end
