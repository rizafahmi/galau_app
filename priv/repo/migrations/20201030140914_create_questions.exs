defmodule GalauApp.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :body, :string
      add :answer1, :string
      add :answer1_count, :integer
      add :answer2, :string
      add :answer2_count, :integer
      add :answer3, :string
      add :answer3_count, :integer
      add :answer4, :string
      add :answer4_count, :integer
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
