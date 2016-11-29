class Urlshortener < ApplicationRecord
	require 'securerandom'
	before_create :set_expiration_date

	validates :url, :presence => true
    
	def generate_url
	  begin
	    self.shortened = SecureRandom.urlsafe_base64(6)
	  end while Urlshortener.exists?(:shortened => self.shortened)
	end

	def set_expiration_date
  		self.expiration =  Time.now + 1.minutes
	end

    def self.clean_up
    	puts "THIS IS TEST"
  		self.where('expiration < ?', Time.now).delete_all
	end
end
