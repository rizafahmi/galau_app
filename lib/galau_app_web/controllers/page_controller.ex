defmodule GalauAppWeb.PageController do
  use GalauAppWeb, :controller

  alias GalauApp.Vote

  def index(conn, _params) do
    questions = Vote.list_questions()
    render(conn, "index.html", questions: questions)
  end

  def show(conn, %{"question_id" => question_id}) do
    question = GalauApp.Vote.get_question!(question_id) |> GalauApp.Repo.preload(:answer)
    render(conn, "show.html", question: question)
  end

  def vote(conn, %{"vote_id" => id}) do
    # get question_id
    answer = Vote.get_answer!(id)
    # update counter
    Vote.update_vote_counter(id)
    redirect(conn, to: Routes.page_path(conn, :show, answer.question_id))
  end
end
