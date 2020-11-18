defmodule GalauAppWeb.PageView do
  use GalauAppWeb, :view

  def calculate_percent(question, current_count) do
    total =
      Enum.reduce(question.answer, 0, fn answer, acc ->
        answer.count + acc
      end)

    floor(current_count / total * 100)
  end
end
