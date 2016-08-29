class SMS

	def initialize (to)
		@to = to
	end

	def client
		Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_token
	end

	def send
		client.account.messages.create(
			messaging_service_sid: Rails.application.secrets.twilio_messaging_service_sid,
			to: @to,
			body: "Hello guys!!!"
		)		
	end
end