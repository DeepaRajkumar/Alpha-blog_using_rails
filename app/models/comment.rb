class Comment < ApplicationRecord
  has_rich_text :body
  belongs_to :article 
  validates :body, presence: true, length: { minimum: 10 }
end
