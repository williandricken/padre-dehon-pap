class ResponsibleMailer
  class << self
    include SendGridMailer
    def responsible_created (responsible)
      # template = render template: 'responsible_mailer/responsible_created', :responsible => @responsible
      # content = get_content
      email(
          from: "williandricken@gmail.com",
          to: responsible.user.email,
          content: get_content,
          template_id: "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
      )
    end
  end
end

