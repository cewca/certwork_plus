class AssessmentIndicatorsController < ApplicationController
	before_filter :require_login

	def update 
		id = params[:id]
		
		ind = AssessmentIndicator.find(id.to_i)

		if ind 
			p =JSON.parse(params.require(:indicator))

			ind.update(evidence_url: p["evidence_url"], evidence_filename: p["evidence_filename"], obj_key: p["obj_key"])
			ind.save!
		end
		
		render json: {status: "saved"} 
	end

	def destroy
		id = params[:id]
		
		ind = AssessmentIndicator.find(id.to_i)

		if ind 
			

			ind.update(evidence_url: "", evidence_filename: "")
			ind.save!
		end

		render json: {status: "deleted"} 
	end

	def show
		s3 = AWS::S3.new
	    bucket = s3.buckets['p1012015']
	    object = bucket.objects[params['key']]

	    contenttype= MIME::Types.type_for(params['key']).first.content_type
	

	    link=object.url_for(:get, { 
	      expires: 10.minutes,
	      response_content_type: contenttype
	    }).to_s
	  
	    redirect_to link
	end
end
