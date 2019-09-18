defmodule Todolist.Repo do
  use Ecto.Repo,
    otp_app: :todolistApp,
    adapter: Ecto.Adapters.Postgres
end
