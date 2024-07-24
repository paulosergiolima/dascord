defmodule Dascord.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :datetime, :string
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :datetime])
    |> validate_required([:content, :datetime])
  end
end
