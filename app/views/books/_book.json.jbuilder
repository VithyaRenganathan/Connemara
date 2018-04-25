json.extract! book, :id, :name, :isbn_number, :created_at, :updated_at
json.url book_url(book, format: :json)
