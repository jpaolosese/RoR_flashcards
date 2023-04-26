json.extract! flashcard, :id, :question, :answer, :user_id, :deck_id, :created_at, :updated_at
json.url flashcard_url(flashcard, format: :json)
