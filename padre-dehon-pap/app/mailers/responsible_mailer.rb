class ResponsibleMailer < ActionMailer::Base
  default from: "williandricken@gmail.com"

  def responsible_created (responsible)
    @responsible = responsible
    template = render template: 'responsible_mailer/responsible_created', :responsible => @responsible
    mail(
        to: @responsible.user.email,
        subject: "Seja Bem-Vindo"
    )
  end
end

