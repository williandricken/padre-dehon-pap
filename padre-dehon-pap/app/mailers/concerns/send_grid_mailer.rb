module SendGridMailer
  include SendGrid

  

  list_id = 553385
  sender = 61578

  def get_content
    Content.new(type: 'text/html', value: get_template_ready)
    # Content.new(type: 'text/plain', value: "testing my email man, just chill out")
  end

  def get_all_templates_2
    response = SendGridMailer.sg.client.templates.get()
    puts response.status_code
    templates = JSON.parse(response.body)["templates"] #.first["id"]

    # templates_array = Array.new
    # templates.each do |e|
    #   templates_array << e["id"]
    # end
    # return templates_array
  end

  def get_template (template_id)
    # template_id = "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
    template = SendGridMailer.sg.client.templates._(template_id).get()
    JSON.parse(template.body)["versions"].last["html_content"]
  end

  def get_template_ready
    template_id = "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
    template = SendGridMailer.sg.client.templates._(template_id).get()
    JSON.parse(template.body)["versions"].last["html_content"]
  end

  def get_senders
    response = SendGridMailer.sg.client.senders.get()
    puts response.status_code
    puts response.body
  end

  def get_all_contacts
    # params = JSON.parse('{"page": 1, "page_size": 1}')
    response = SendGridMailer.sg.client.contactdb.recipients.get()  #get(query_params: params)
    puts response.status_code
    puts response.body
  end

  def get_all_categories
    response = SendGridMailer.sg.client.categories.get()
    puts response.status_code
    puts response.body
  end

  def add_contact (responsible)
    res = responsible
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

  def create_campaign
    data = JSON.parse('{
      "categories": [
        "spring line"
      ],
      "custom_unsubscribe_url": "",
      "html_content": "<html><head><title></title></head><body><p>Check out our spring line!</p></body></html>",
      "ip_pool": "marketing",
      "list_ids": [
        110,
        124
      ],
      "plain_content": "Check out our spring line!",
      "segment_ids": [
        110
      ],
      "sender_id": 124451,
      "subject": "New Products for Spring!",
      "suppression_group_id": 42,
      "title": "March Newsletter"
    }')
    response = SendGridMailer.sg.client.campaigns.post(request_body: data)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def send_campaign
    campaign_id = 480738
    response = SendGridMailer.sg.client.campaigns._(campaign_id).schedules.now.post()
    puts response.status_code
    puts response.body
  end

  def send_test_email

    data = JSON.parse('{
      "personalizations": [
        {
          "to": [
            {
              "email": "willian@ebanx.com"
            }
          ],
          "subject": "test12",

          "sub": {
        ":name": "Alice" 
      }

        }
      ],

      

      "from": {
        "email": "williandricken@gmail.com"
      },

      "filters": {
        "templates": {
          "settings": {
            "enable": 1,
            "template_id": "41a43df9-1cc0-4f1a-8ee8-e0b146f22bfb"
          }
        }
      },

      "content": [
        {
          "type": "text/html",
          "value": "teste123"
        }
      ]
    }')

      # "template_id": "41a43df9-1cc0-4f1a-8ee8-e0b146f22bfb",
      # "template_id": "9b8ee263-1120-44b6-a287-a01f0dd4ec36",
response = SendGridMailer.sg.client.mail._("send").post(request_body: data)
puts response.status_code
puts response.body
  end

def send_email_form (transactional_email)
  mail = Mail.new
  mail.from = Email.new(email: transactional_email.from)
  mail.subject = transactional_email.subject
  personalizations = Personalization.new
  personalizations.to = Email.new(email: transactional_email.to)
  personalizations.substitutions = Substitution.new(key: '%content%', value: transactional_email.content)

  mail.personalizations = personalizations
  mail.contents = Content.new(type: 'text/html', value: 'test')
  mail.template_id = transactional_email.template_id
  response = SendGridMailer.sg.client.mail._('send').post(request_body: mail.to_json)
  # puts response.status_code
  # puts response.body
  # puts response.headers
end

def hello_world
  mail = Mail.new
  mail.from = Email.new(email: 'williandricken@gmail.com')
  mail.subject = 'Hello World from the SendGrid4'
  p = Personalization.new
  p.to = Email.new(email: 'willian@ebanx.com')
  p.substitutions = Substitution.new(key: '%name%', value: 'Elmer Thomas')
  p.substitutions = Substitution.new(key: '%city%', value: 'Denver')
  p.substitutions = Substitution.new(key: '%var%', value: 'http://www.sendgrid.com')
  p.substitutions = Substitution.new(key: '%value%', value: 'SendGrid.com')
  p.substitutions = Substitution.new(key: '%content%', value: '

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed sem a nisi vestibulum gravida. Ut pulvinar nisl vitae neque commodo luctus. Nulla ac euismod nulla. Nam ornare ultricies sapien eu efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur id nunc sed lectus laoreet eleifend ut lobortis lacus. Quisque consequat lorem et maximus rhoncus. Morbi libero mauris, consectetur id convallis sit amet, ullamcorper nec enim. Morbi egestas est eu sapien condimentum, quis tincidunt tortor semper. Ut porta molestie erat id convallis. Donec id leo nibh. Cras vel efficitur leo. Cras porta massa non efficitur lobortis. Mauris nec finibus enim.

Nullam eu finibus lorem, eu maximus enim. Duis in scelerisque arcu, a interdum diam. Cras eget eleifend augue. Etiam varius venenatis interdum. Suspendisse sem tortor, condimentum vitae urna et, ornare vulputate augue. Morbi bibendum arcu sed massa finibus hendrerit ut pharetra lectus. Etiam id. ')
  mail.personalizations = p
  # This will no longer be a requirement soon
  mail.contents = Content.new(type: 'text/html', value: 'test')
  mail.template_id = 'e4aa6e75-aaa1-4399-baf0-bc17a7d242d7'

  # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
  response = SendGridMailer.sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

  def test_campaign
    data = JSON.parse('{
      "to": "willian@ebanx.com"
    }')
    campaign_id = 475264
    response = SendGridMailer.sg.client.campaigns._(campaign_id).schedules.test.post(request_body: data)
    puts response.status_code
    puts response.body
  end

  def get_all_lists
    response = SendGridMailer.sg.client.contactdb.lists.get()
    puts response.status_code
    puts response.body
  end

  def get_all_templates
    JSON.parse(SendGridMailer.sg.client.templates.get().body)['templates']
  end

  def email (params = {})
    params[:from] = Email.new(email: params[:from])
    params[:to] = Email.new(email: params[:to])
    # "mail_settings": {
    #   "sandbox_mode": {
    #       "enable": true
    #   }
    # }
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