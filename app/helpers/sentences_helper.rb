module SentencesHelper
	def sentence_expires_in(created_at)
    ((created_at.to_date + 14).to_date - DateTime.now.to_date).to_i
  end
end
