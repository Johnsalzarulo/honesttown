class Tweet < ActiveRecord::Base
		belongs_to :sentence

		validates :username, presence: true

end
