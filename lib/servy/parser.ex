defmodule Servy.Parser do
  @moduledoc """
  Parses a given request into a Conv object
  """

  alias Servy.Conv

  @doc "Parses request string and builds initial `conv` object"
  def parse(request) do
    [top, params_string] = String.split(request, "\n\n")

    [request_line | header_lines] = String.split(top, "\n")

    params = parse_params(params_string)

    [method, path, _] = String.split(request_line, " ")

    %Conv{
      method: method,
      path: path,
      params: params
    }
  end

  def parse_params(params_string) do
    params_string |> String.trim |> URI.decode_query
  end
end
