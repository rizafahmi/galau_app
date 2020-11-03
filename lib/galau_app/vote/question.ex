defmodule GalauApp.Vote.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field(:answer1, :string)
    field(:answer1_count, :integer)
    field(:answer2, :string)
    field(:answer2_count, :integer)
    field(:answer3, :string)
    field(:answer3_count, :integer)
    field(:answer4, :string)
    field(:answer4_count, :integer)
    field(:body, :string)
    field(:status, :boolean, default: false)
    # field(:user_id, :id)

    belongs_to(:user, GalauApp.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [
      :body,
      :answer1,
      :answer1_count,
      :answer2,
      :answer2_count,
      :answer3,
      :answer3_count,
      :answer4,
      :answer4_count,
      :status
    ])
    |> validate_required([
      :body
    ])
  end
end
