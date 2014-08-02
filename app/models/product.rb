class Product < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "600x600#", :thumb => "300x300#" }
	validates :image, presence: true
	validates :description, presence: true
	validates :hyperlink, presence: true
	validates :title, presence: true
end
