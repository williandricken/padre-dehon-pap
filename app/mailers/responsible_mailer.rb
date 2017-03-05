class ResponsibleMailer
  class << self
    include SendGridMailer

    # @@responsible = Responsible.first

    def get_responsible_tags (responsible)
      responsible_content_tags = {
        responsible_name: responsible.name,
        responsible_cpf: responsible.cpf,
        responsible_rg: responsible.rg
      }
    end

    def responsible_welcome_email(responsible)
      # responsible = Responsible.find(responsible_id)
      # template = render template: 'responsible_mailer/responsible_created', :responsible => @responsible
      # content = get_content
      email(
          from: "willian@ebanx.com",
          to: responsible.user.email,
          content: get_content,
          template_id: "9b8ee263-1120-44b6-a287-a01f0dd4ec36"
      )

    end

    def send_email (transactional_email, responsible)
      # responsible_content_tags = get_responsible_tags(responsible)
      # transactional_email.content = replace_content(transactional_email.content, responsible_content_tags)
      send_email_form(transactional_email)
    end

    def replace_content (content, responsible_content_tags)
      # content = "Testando %responsible_name%, e outros como %responsible_cpf% e claro %responsible_rg%."
      new_content = content.dup
        responsible_content_tags.map do |k,v|
          new_content.gsub!("%#{k}%", v)
        end
      return new_content
    end

  end
end

