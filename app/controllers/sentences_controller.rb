class SentencesController < ApplicationController

	  helper SentencesHelper


	def create
	    @person = Person.find(params[:person_id])
	    @sentence = @person.sentences.create(sentence_params)
	    redirect_to person_path(@person)
	end

	private
	    def sentence_params
	      params.require(:sentence).permit(:verb, :subject, :adjective)
	end


end

