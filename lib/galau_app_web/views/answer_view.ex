defmodule GalauAppWeb.AnswerView do
  use GalauAppWeb, :view

  def question_select_options(questions) do
    for question <- questions, do: {question.body, question.id}
  end
end
