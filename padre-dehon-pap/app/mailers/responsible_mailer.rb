class ResponsibleMailer
  class << self
    include SendGridMailer

    responsible_content_tags = Hash.new
    def responsible_welcome_email (responsible)
      # template = render template: 'responsible_mailer/responsible_created', :responsible => @responsible
      # content = get_content
      email(
          from: "williandricken@gmail.com",
          to: responsible.user.email,
          content: get_content,
          template_id: "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
      )

    end

    def send_email (transactional_email)
      replace_content(transactional_email.content)
    end

    def replace_content (content)
      
    end
  end
end

