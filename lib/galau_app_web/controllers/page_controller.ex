defmodule GalauAppWeb.PageController do
  use GalauAppWeb, :controller

  alias GalauApp.Vote

  def index(conn, _params) do
    questions = Vote.list_questions()
    render(conn, "index.html", questions: questions)
  end

  def show(conn, %{"question_id" => question_id}) do
    question = GalauApp.Vote.get_question!(question_id) |> GalauApp.Repo.preload(:answer)
    IO.inspect(question)
    render(conn, "show.html", question: question)
  end

  def vote(conn, _params) do
    redirect(conn, to: Routes.page_path(conn, :index))
  end
end
