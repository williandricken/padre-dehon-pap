module SendGridMailer
  include SendGrid
  # extend ActiveSupport::Concern
  # def mail (params = {})
  #   send_email(params)
  # end

  def get_content
    template_id = "41a43df9-1cc0-4f1a-8ee8-e0b146f22bfb"
    template = SendGridMailer.sg.client.templates._(template_id).get()
    Content.new(type: 'text/html', value: JSON.parse(template.body)["versions"].last["html_content"])
  end

  def email (params = {})
    params[:from] = Email.new(email: params[:from])
    params[:to] = Email.new(email: params[:to])
    SendGridMailer::MessageDeliver.new(Mail.new(*params.values))
  end

  class SendGridMailer::MessageDeliver
    def initialize mail
      @mail = mail
    end

    def deliver_now
      SendGridMailer.sg.client.mail._('send').post(request_body: @mail.to_json)
    end
  end

  def self.sg
    SendGrid::API.new(api_key: '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')
  end
end