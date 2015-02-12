task :deleteexpired do 

	Sentence.expired.each do |sentence| 
		sentence.destroy 
	end 
	
end