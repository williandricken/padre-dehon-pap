module SendGridMailer
  include SendGrid
  # extend ActiveSupport::Concern
  # def mail (params = {})
  #   send_email(params)
  # end

  def get_content
    Content.new(type: 'text/html', value: get_template)
  end

  def get_template
    template_id = "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
    template = SendGridMailer.sg.client.templates._(template_id).get()
    JSON.parse(template.body)["versions"].last["html_content"]
  end

  def self.get_templates
    JSON.parse(SendGridMailer.sg.client.templates.get().body)['templates']
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