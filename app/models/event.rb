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
  validate :end_time_after_start_time?
  validates :recurrent, inclusion: { in: [true, false] }



  def end_date_after_start_date?
    if end_date != nil && start_date
      if DateTime.parse(self.end_date.to_s) < DateTime.parse(self.start_date.to_s)
        errors.add( :base,"Fecha fin no puede ser menor a la fecha de inicio")
      end
    end
  end

	def end_time_after_start_time?
		if end_time != nil && start_time
			if Time.parse(self.end_time.to_s) < Time.parse(self.start_time.to_s)
				errors.add( :end_time," no puede ser menor a la hora de inicio")
			end
	 	end
	end

	def self.single_event
	  # we create a calendar with one single event
	  calendar = Icalendar::Calendar.new
	  calendar.event do |e|
	    # the event starts on January first and lasts from half past eight to five o' clock
	    e.dtstart     =  DateTime.civil(2018, 1, 1, 8, 30)
	    e.dtend       =  DateTime.civil(2018, 1, 1, 17, 00)
	    e.summary     = 'Working'
	    e.description = 'Description'
	    # the event repeats all working days
	    weekDay = Date::ABBR_DAYNAMES[Date.today.wday].upcase[0,2]
	    e.rrule       = "FREQ=WEEKLY;BYDAY=#{ weekDay };INTERVAL=1;UNTIL=20180930T030000Z"
	  end
	  text_cal = calendar.to_ical
	  puts text_cal
	end

	before_validation(on: :create) do
		if (self.recurrent != true)
			self.recurrent = false
		end
		if (self.end_date.blank?)
			self.end_date = self.start_date
		end

  end

end
