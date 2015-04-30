defmodule HelloPhoenix.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :content, :string

      timestamps
    end
  end
end
