class Page < ApplicationRecord
  validates :title, :body, presence: true
end
