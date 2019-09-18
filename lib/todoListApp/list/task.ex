defmodule Todolist.List.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :status, :boolean, default: false
    field :title, :string
    belongs_to :user, Todolist.List.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status])
    |> validate_required([:title, :description, :status,:user])
  end
end
