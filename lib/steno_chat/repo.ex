defmodule StenoChat.Repo do
  use Ecto.Repo,
    otp_app: :steno_chat,
    adapter: Ecto.Adapters.Postgres
end
