defmodule Todolist.ListTest do
  use Todolist.DataCase

  alias Todolist.List

  describe "users" do
    alias Todolist.List.User

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{first_name: nil, last_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> List.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert List.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert List.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = List.create_user(@valid_attrs)
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = List.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = List.update_user(user, @update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = List.update_user(user, @invalid_attrs)
      assert user == List.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = List.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> List.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = List.change_user(user)
    end
  end

  describe "tasks" do
    alias Todolist.List.Task

    @valid_attrs %{description: "some description", status: true, title: "some title"}
    @update_attrs %{description: "some updated description", status: false, title: "some updated title"}
    @invalid_attrs %{description: nil, status: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> List.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert List.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert List.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = List.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.status == true
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = List.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = List.update_task(task, @update_attrs)
      assert task.description == "some updated description"
      assert task.status == false
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = List.update_task(task, @invalid_attrs)
      assert task == List.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = List.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> List.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = List.change_task(task)
    end
  end
end
