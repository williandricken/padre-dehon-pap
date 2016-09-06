module SendGridMailer
  include SendGrid

  

  list_id = 553385

  def get_content
    Content.new(type: 'text/html', value: get_template)
  end

  def get_template
    template_id = "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
    template = SendGridMailer.sg.client.templates._(template_id).get()
    JSON.parse(template.body)["versions"].last["html_content"]
  end

  def get_all_contacts
    # params = JSON.parse('{"page": 1, "page_size": 1}')
    response = SendGridMailer.sg.client.contactdb.recipients.get()  #get(query_params: params)
    puts response.status_code
    puts response.body
  end

  def add_contact
    res = Responsible.last
    # request = "[
    #   {
    #     'email': '#{res.user.email}',
    #     'first_name': '',
    #     'last_name': '',
    #     'responsible_name': '#{res.name}',
    #     'student_name': '#{res.students.first.name}'
    #   }"
    # request = request.to_json
    data = [{
      "email": res.user.email,
      "first_name": "",
      "last_name": "",
      "responsible_name": res.name,
      "student_name": res.students.first.name
    }].to_json
    # data2 = JSON.parse(data.to_json)
    response = SendGridMailer.sg.client.contactdb.recipients.post(request_body: JSON.parse(data))
    puts response.status_code
    puts response.body
  end

  def add_contact_to_list
    data = JSON.parse('[
      "c3RheW1hbmx5QGdtYWlsLmNvbQ=="
    ]')
    list_id = 559984
    response = SendGridMailer.sg.client.contactdb.lists._(list_id).recipients.post(request_body: data)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def get_all_campaigns
    #params = JSON.parse('{"limit": 1, "offset": 1}')
    response = SendGridMailer.sg.client.campaigns.get() #(query_params: params)
    puts response.status_code
    puts response.body
  end

  def send_campaign
    campaign_id = 480738
    response = SendGridMailer.sg.client.campaigns._(campaign_id).schedules.now.post()
    puts response.status_code
    puts response.body
  end

  def test_campaign
    data = JSON.parse('{
      "to": "willian@ebanx.com"
    }')
    campaign_id = 475264
    response = SendGridMailer.sg.client.campaigns._(campaign_id).schedules.test.post(request_body: data)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def get_all_lists
    response = SendGridMailer.sg.client.contactdb.lists.get()
    puts response.status_code
    puts response.body
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