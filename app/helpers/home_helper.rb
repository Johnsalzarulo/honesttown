module HomeHelper
	def randomsentence
		subject = $subject.sample[0].capitalize
		verb = $verb.sample[0]
		adjective = $adjective.sample[0]
		return subject + " " + verb + " " + adjective +"."
  end

	def randombackground
		(0...12).sample
  end

end
