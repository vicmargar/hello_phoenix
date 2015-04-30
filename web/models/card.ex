defmodule HelloPhoenix.Card do
  use HelloPhoenix.Web, :model

  schema "cards" do
    field :title, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w(content)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:title, on: HelloPhoenix.Repo)
  end
end
