defmodule GalauApp.VoteTest do
  use GalauApp.DataCase

  alias GalauApp.Vote

  describe "questions" do
    alias GalauApp.Vote.Question

    @valid_attrs %{answer1: "some answer1", answer1_count: 42, answer2: "some answer2", answer2_count: 42, answer3: "some answer3", answer3_count: 42, answer4: "some answer4", answer4_count: 42, body: "some body", status: true}
    @update_attrs %{answer1: "some updated answer1", answer1_count: 43, answer2: "some updated answer2", answer2_count: 43, answer3: "some updated answer3", answer3_count: 43, answer4: "some updated answer4", answer4_count: 43, body: "some updated body", status: false}
    @invalid_attrs %{answer1: nil, answer1_count: nil, answer2: nil, answer2_count: nil, answer3: nil, answer3_count: nil, answer4: nil, answer4_count: nil, body: nil, status: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vote.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Vote.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Vote.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Vote.create_question(@valid_attrs)
      assert question.answer1 == "some answer1"
      assert question.answer1_count == 42
      assert question.answer2 == "some answer2"
      assert question.answer2_count == 42
      assert question.answer3 == "some answer3"
      assert question.answer3_count == 42
      assert question.answer4 == "some answer4"
      assert question.answer4_count == 42
      assert question.body == "some body"
      assert question.status == true
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vote.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Vote.update_question(question, @update_attrs)
      assert question.answer1 == "some updated answer1"
      assert question.answer1_count == 43
      assert question.answer2 == "some updated answer2"
      assert question.answer2_count == 43
      assert question.answer3 == "some updated answer3"
      assert question.answer3_count == 43
      assert question.answer4 == "some updated answer4"
      assert question.answer4_count == 43
      assert question.body == "some updated body"
      assert question.status == false
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Vote.update_question(question, @invalid_attrs)
      assert question == Vote.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Vote.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Vote.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Vote.change_question(question)
    end
  end
end
