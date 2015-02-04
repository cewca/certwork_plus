class Message < ActiveRecord::Base
	before_create :record_date 
	belongs_to :from, class_name: "User", foreign_key: "from_user_id"
	belongs_to :to, class_name: "User", foreign_key: "to_user_id"
	validates_presence_of :from
	validates_presence_of :to
	validates_presence_of :subject
	def from_username 
		from.username
	end

	def to_username
		to.username
	end

	protected 
	def record_date 
	    self.created_at = read_attribute(:created_at) || Time.now 
	end 
end