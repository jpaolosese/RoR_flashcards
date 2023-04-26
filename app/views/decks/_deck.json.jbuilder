json.extract! deck, :id, :topic, :card_count, :user_id, :created_at, :updated_at
json.url deck_url(deck, format: :json)
