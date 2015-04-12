task :deleteexpired => :environment do 
	Sentence.all.each do |sentence| 
		if sentence.expired?
			sentence.destroy 
			sentence.save
		end
	end 
	
end