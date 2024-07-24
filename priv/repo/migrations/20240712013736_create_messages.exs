defmodule Dascord.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :text
      add :datetime, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
