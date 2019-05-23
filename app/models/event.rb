class Event < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  acts_as_votable
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :start_date, presence: true, if: -> { date.blank? }
  validates :end_date, presence: true, if: -> { date.blank? }
  validates :date, presence: true, if: -> { start_date.blank? ^ end_date.blank? }
  validate :end_date_after_start_date?
  validates :recurrent, inclusion: { in: [true, false] }



  def end_date_after_start_date?
    if end_date != nil && start_date
      if DateTime.parse(self.end_date.to_s) < DateTime.parse(self.start_date.to_s)
        errors.add( :base,"Fecha fin no puede ser menor a la fecha de inicio")
      end
    end
  end

  before_validation(on: :create) do
    if (self.recurrent != true)
      self.recurrent = false
    end

  end

end
