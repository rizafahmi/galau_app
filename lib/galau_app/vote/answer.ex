defmodule GalauApp.Vote.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field(:count, :integer)
    field(:text, :string)
    # field(:question_id, :id)

    belongs_to(:question, GalauApp.Vote.Question)
    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:text, :count, :question_id])
    |> validate_required([:text, :count])
  end
end
