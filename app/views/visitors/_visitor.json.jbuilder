json.extract! visitor, :id, :user_id, :user_name, :user_code, :station_id, :station_name, :merchant, :ip, :visist_status, :visit_time, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)