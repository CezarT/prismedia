class Link < ActiveRecord::Base
	belongs_to :user
	belongs_to :timeline
  belongs_to :media_outlet

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :media_outlet_id, :lnk, :title, :date_published, presence: true

	acts_as_votable

  scope :by_date, -> (ord) {order('date_published '+ ord)}
  scope :by_type, lambda { |type| joins(:media_outlet).where(media_outlets: { media_outlet_type_id:  type })}

	def extract_shares
		fb_link =  'https://api.facebook.com/method/links.getStats?urls='+ self.lnk + '&format=json'
		fb = HTTParty.get(fb_link)
  	fb_shares = fb[0] != nil ? fb[0]["total_count"] : 0
    self.total_shares =  fb_shares
	end
end