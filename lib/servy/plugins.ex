defmodule Servy.Plugins do
  alias Servy.Conv

  @doc "Tracks 404 errors"
  def track(%Conv{status: 404, path: path} = conv) do
    IO.puts("404 Error: #{path}")
    conv
  end

  def track(%Conv{} = conv), do: conv

  def log(%Conv{} = conv), do: IO.inspect(conv)
end
