class Subject < ApplicationRecord
  belongs_to :year
  has_many :events
  validates :name, presence: true
end
