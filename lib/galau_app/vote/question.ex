defmodule GalauApp.Vote.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field(:body, :string)
    field(:status, :boolean, default: false)

    belongs_to(:user, GalauApp.Accounts.User)
    has_many(:answer, GalauApp.Vote.Answer)

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [
      :body,
      :status
    ])
    |> validate_required([
      :body
    ])
  end
end
