class AssessmentsController < ApplicationController
	before_filter :require_login
	
	def update
		indicators = JSON.parse(params["assessment_plan"])
		indicators.each do |ind|
			oldInd=AssessmentIndicator.find(ind["id"])
			selected_option = ind["selectedOption"] ? ind["selectedOption"]["code"] : nil
			oldInd.evidence_option = selected_option
			oldInd.due_date = DateTime.parse(ind["due_date"])
			oldInd.save!

		end

		render json: {status: "saved"} 
	end
end
