defmodule AlphaVantage do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://www.alphavantage.co/query?" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

end