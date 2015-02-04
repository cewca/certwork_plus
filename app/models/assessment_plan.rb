class AssessmentPlan < ActiveRecord::Base
	before_create :record_date 
	belongs_to :candidate, class_name: "User", foreign_key: "candidate_id"
	belongs_to :approved_by, class_name: "User", foreign_key: "approved_by_id"
	belongs_to :assigned_by, class_name: "User", foreign_key: "assigned_by_id"
	has_many :assessment_indicators
	validates_presence_of :assigned_by
	validates_presence_of :candidate
	
	def assigned_by_username 
		assigned_by.username
	end

	def approved_by_username 
		approved_by ? approved_by.username : ""
	end

	def candidate_username
		candidate.username
	end

	protected 
	def record_date 
	    self.created_at = read_attribute(:created_at) || Time.now 
	end 
end