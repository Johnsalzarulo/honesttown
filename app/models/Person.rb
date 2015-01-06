class Person < ActiveRecord::Base
	has_many :sentences
	validates_uniqueness_of :name, :scope => [:location]
end
