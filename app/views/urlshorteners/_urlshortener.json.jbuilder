json.extract! urlshortener, :id, :url, :shortened, :clicks, :created_at, :updated_at
json.url urlshortener_url(urlshortener, format: :json)