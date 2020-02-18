defmodule Ponyta.AlphaVantage do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://www.alphavantage.co/query?" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def get_price(stock_symbol) do
    "function=GLOBAL_QUOTE&symbol=#{stock_symbol}&apikey=6674"
    |> Ponyta.AlphaVantage.get!
    |> Map.fetch!(:body)
    |> hd
    |> (fn({:"Global Quote", value}) -> value |> Map.get("05. price") |> String.to_float end).()
  end

end