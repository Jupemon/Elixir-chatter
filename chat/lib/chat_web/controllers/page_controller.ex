defmodule ChatWeb.PageController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end


  def handle_event("increment", _no, socket) do
    IO.puts("Increment happens")
    {:noreply, socket}
  end


  def handle_event("decrement", _no, socket) do
    IO.puts("Decrement happens")
    count = socket.assigns.count - 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  def mount(_session, _something, socket) do
    socket = assign(socket, :count, 0)
    {:ok, socket}
  end
end
