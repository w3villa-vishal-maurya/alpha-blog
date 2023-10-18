class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 20 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }

  belongs_to :user

  paginates_per 2

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "title", "updated_at"]
  end
end
