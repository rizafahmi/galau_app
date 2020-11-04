defmodule GalauAppWeb.QuestionController do
  use GalauAppWeb, :controller

  alias GalauApp.Vote
  alias GalauApp.Vote.Question

  plug(:authenticate)

  def index(conn, _params) do
    questions = Vote.list_user_questions(conn.assigns.current_user)
    render(conn, "index.html", questions: questions)
  end

  def new(conn, _params) do
    changeset = Vote.change_question(%Question{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"question" => question_params}) do
    case Vote.create_question(conn.assigns.current_user, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    question = Vote.get_user_question!(conn.assigns.current_user, id)
    render(conn, "show.html", question: question)
  end

  def edit(conn, %{"id" => id}) do
    question = Vote.get_question!(conn.assigns.current_user, id)
    changeset = Vote.change_question(question)
    render(conn, "edit.html", question: question, changeset: changeset)
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = Vote.get_question!(conn.assigns.current_user, id)

    case Vote.update_question(question, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question updated successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", question: question, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    question = Vote.get_question!(conn.assigns.current_user, id)
    {:ok, _question} = Vote.delete_question(question)

    conn
    |> put_flash(:info, "Question deleted successfully.")
    |> redirect(to: Routes.question_path(conn, :index))
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be login")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
