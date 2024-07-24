defmodule Dascord.Repo.Migrations.ChangeDatime do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      modify :datetime, :text 
    end
  end
end
