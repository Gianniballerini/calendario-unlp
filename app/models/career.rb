class Career < ApplicationRecord
	has_many :years
	validates :name, presence: true
end
