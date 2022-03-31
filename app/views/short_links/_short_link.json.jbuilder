json.extract! short_link, :id, :full_url, :short_link, :created_at, :updated_at
json.url short_link_url(short_link, format: :json)
