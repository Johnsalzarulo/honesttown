class Sentence < ActiveRecord::Base
	belongs_to :person
  has_many :tweets

    def self.not_expired
      select do |record| 
      	!record.expired?
      end
    end

     def self.expired
      select do |record| 
      	record.expired?
      end
    end



    def expired?
    	@expired = true
    	if ((created_at.to_date + 30).to_date - DateTime.now.to_date).to_i < 1
				@expired = true
			else
				@expired = false
			end
			return @expired
		end
end
