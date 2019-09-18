defmodule Todolist.TodolistsTest do
  use Todolist.DataCase

  alias Todolist.Todolists

  describe "users" do
    alias Todolist.Todolists.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todolists.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Todolists.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Todolists.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Todolists.create_user(@valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todolists.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Todolists.update_user(user, @update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Todolists.update_user(user, @invalid_attrs)
      assert user == Todolists.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Todolists.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Todolists.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Todolists.change_user(user)
    end
  end
end
