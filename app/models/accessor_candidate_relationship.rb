class AccessorCandidateRelationship < ActiveRecord::Base
	before_create :record_date 

	belongs_to :accessor, class_name: "User", foreign_key: "accessor_id"
	belongs_to :candidate, class_name: "User", foreign_key: "candidate_id"
	validates_presence_of :accessor
	validates_presence_of :accessor
	
	def accessor_username 
		accessor.username
	end

	def candidate_username
		candidate.username
	end

	protected 
	def record_date 
	    self.created_at = read_attribute(:created_at) || Time.now 
	end 
end