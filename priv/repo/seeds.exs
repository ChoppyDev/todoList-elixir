# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todolist.Repo.insert!(%Todolist.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Todolist.Repo
alias Todolist.List.User
alias Todolist.List.Task

# Repo.insert! %User{
#     first_name: "Nathan",
#     last_name: "Dubois"
# }
# Repo.insert! %User{
#     first_name: "Alphonse",
#     last_name: "Beret"
# }
# Repo.insert! %User{
#     first_name: "Charline",
#     last_name: "Nougat"
# }
# Repo.insert! %User{
#     first_name: "Nicolas",
#     last_name: "Pasteqye"
# }
# Repo.insert! %User{
#     first_name: "Aline",
#     last_name: "Douba"
# }

Repo.insert! %Task {
    title: "Une tache de merde MDRRRRRRRRRRRRRRRRR",
    description: "Lorem ipsoum dolor morgulis mdr lol ptdr",
    status: true,
    user: 14

}