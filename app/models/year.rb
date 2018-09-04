class Year < ApplicationRecord
  belongs_to :career
  has_many :subjects
  validates :name, presence: true
end
