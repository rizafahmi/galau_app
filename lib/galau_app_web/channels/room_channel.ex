defmodule GalauAppWeb.RoomChannel do
  use GalauAppWeb, :channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.inspect(body)
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  def handle_in("increment", %{"id" => id}, socket) do
    # get answer by id
    answer = GalauApp.Vote.get_answer!(String.to_integer(id))
    IO.inspect(answer)
    # update answer count
    {:ok, answer} = GalauApp.Vote.update_answer(answer, %{count: answer.count + 1})
    broadcast!(socket, "change_data", %{id: id, count: answer.count})
    {:noreply, socket}
  end
end
