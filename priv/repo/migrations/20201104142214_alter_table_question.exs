defmodule GalauApp.Repo.Migrations.AlterTableQuestion do
  use Ecto.Migration

  def change do
    alter table(:questions) do
      remove :answer1
      remove :answer2
      remove :answer3
      remove :answer4
      remove :answer1_count
      remove :answer2_count
      remove :answer3_count
      remove :answer4_count
    end
  end
end
