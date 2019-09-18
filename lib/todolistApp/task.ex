defmodule Todolist.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :status, :integer
    field :title, :string
    field :user, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status])
    |> validate_required([:title, :description, :status])
  end
end
