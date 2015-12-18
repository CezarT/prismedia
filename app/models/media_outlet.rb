class MediaOutlet < ActiveRecord::Base
	def self.mediaTypes
		{1 => "Agenţie de Ştiri", 2 => "Bloguri", 3 => "Reţele Sociale"}
	end
end
