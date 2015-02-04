class CandidateDashboardController < ApplicationController
	before_filter :require_login

	def index
		@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
	end
end
