class AssessmentIndicator < ActiveRecord::Base
	belongs_to :assessment_plan, class_name: :AssessmentPlan
	validates_presence_of :name
	validates_presence_of :assessment_plan
end