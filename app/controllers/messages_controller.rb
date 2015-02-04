class MessagesController < ApplicationController
	before_filter :require_login

	
	def index
		id = current_user.id
	end

	def create 
		errors=[]
		result=[]
		message = params["message"]
		
		recipients = message["to"].split(';')
		recipients.each do |r,idx|
			u = User.where("lower(username) = ?", r.strip).first
			unless u
				errors.push("Recipient "+ r +" does not exist.")
			else
				message = Message.create(from: current_user, to: u, subject: message["subject"], body: message["body"])
				
				if message.save
					result.push("Message has been sent to " + r)
				else
					errors.push("Failed sending message to " +r)
					message.errors.messages.each do |err|
						errors.push(err)
					end
				end
			end
	
		end

		render json: {result: result, errors: errors}
	end

	def update
		id = params[:id]
		msg = Message.find(id)

		if msg
			msg.read= true
			msg.save
		end
		render json: {status: "success"}
	end

	def destroy
		ids = params[:message_ids]
		Message.destroy(ids)
		render json: {status: "success"}
	end
end
