defmodule ChatWeb.RoomLive do
  # In Phoenix v1.6+ apps, the line below should be: use MyAppWeb, :live_view
  use Phoenix.LiveView

  @impl true
  def handle_event("increment", _no, socket) do
    random_slug = "/" <> MnemonicSlugs.generate_slug(4)
    IO.puts(random_slug)
    count = socket.assigns.count + 1
    socket = assign(socket, :count, count)
    {:noreply, push_redirect(socket, to: random_slug)}
  end

  @impl true
  def handle_event("decrement", _no, socket) do
    IO.puts("Decrement happens")
    count = socket.assigns.count - 1
    socket = assign(socket, :count, count)
    {:noreply, socket}
  end

  @impl true
  def mount(%{"id" => room_id}, _session, socket) do
    socket = assign(socket, :room_id, room_id)
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~L"""
    <p>Currently chatting in <strong><%= @room_id %></strong></p>
    """
  end

end
