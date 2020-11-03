defmodule GalauApp.Repo.Migrations.RelateQuestionsWithUser do
  use Ecto.Migration

  def change do
    alter table(:questions) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
