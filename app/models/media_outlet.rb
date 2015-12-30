class MediaOutlet < ActiveRecord::Base
	belongs_to :media_outlet_type
	has_many :links
end