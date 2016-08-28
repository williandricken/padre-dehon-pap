class ResponsibleMailer
  class << self
    include SendGridMailer
    def responsible_created (responsible)
      # template = render template: 'responsible_mailer/responsible_created', :responsible => @responsible
      # content = get_content
      email(
          from: "williandricken@gmail.com",
          subject: "Seja Bem-Vindo",
          to: responsible.user.email,
          content: get_content
      )
    end
  end
end

