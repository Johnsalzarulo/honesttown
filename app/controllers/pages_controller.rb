class PagesController < ApplicationController


	def about

	end

	def home
		@sentences = Sentence.all.sample(4)
		@person = Person.new
	end

end