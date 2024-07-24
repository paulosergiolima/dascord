defmodule DascordWeb.RoomChannel do
  alias Dascord.Message
  alias Dascord.Repo
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", params, socket) do 
    message = %Dascord.Message{content: params["content"], datetime: params["datetime"]}
    Repo.insert(message)
    broadcast!(socket, "new_msg", %{content: params["content"], datetime: params["datetime"]})
    {:noreply, socket}
  end
  def handle_in("new_client", _body, socket) do 
    messages = Message |> Repo.all()
    Enum.each(messages, &broadcast!(socket, "login", %{content: &1.content, datetime: &1.datetime}))
    {:noreply, socket}
  end
end
