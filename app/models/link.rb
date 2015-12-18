class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :timeline
  belongs_to :media

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	acts_as_votable

  scope :sort, -> (ord) {order('date_published '+ ord)}

	def extract_shares
		fb_link =  'https://api.facebook.com/method/links.getStats?urls='+ self.lnk + '&format=json'
		fb = HTTParty.get(fb_link)
    if (fb[0] != nil) 
  		fb_shares =  fb[0]["total_count"]
      self.total_shares =  fb_shares
    end
	end
end