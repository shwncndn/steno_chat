defmodule StenoChatWeb.MainLive.Index do
  use StenoChatWeb, :live_view

  @moduledoc """
  Main user interface consisting of the caption window and user chat
  """

  def mount(_params, _session, socket) do
    {:ok, assign(socket, greeting: "Welcome to StenoChat")}
  end
end
