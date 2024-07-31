defmodule StenoChatWeb.ChatComponent do
  use StenoChatWeb, :live_component

  def render(assigns) do
    ~H"""
      <div class="chat border-4 border-blue-600 overflow-y-auto">

        <input type="text" />
        <button>Send</button>

      </div>
    """
  end
end
