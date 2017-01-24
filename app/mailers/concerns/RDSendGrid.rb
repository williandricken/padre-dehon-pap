# Begin Code
module RDSendGrid

  # I use this to return a standard result from the class no matter what I get back from the vendor
  class FakeRes
    attr_accessor :code
    attr_accessor :body
  end

  class RDSendGrid

    require "uri"
    require 'sendgrid-ruby'

    def initialize
    end # initialize

    ##########################################################################
    # audit_id: the id of my internal record for this email
    # template_id: the template id provided by SendGrid for the template I want to send
    # from_email: the address to use as the sender’s email
    # from_name:  name to show instead of the address in the recipient’s mail client
    # to_email: The address to send the message to
    # to_name: The name of the person to send the message to
    # subject: the subject of the email message
    # merge_vars: an array of attribute value pairs of replacement variables
    #    these get sent en-mas to the template engine and are specific to each template
    #    the pairs are “name” and “content”
    # bcc: provide an email address here if I want to bcc someone on this message
    ##########################################################################

    def sendtemplate(audit_id, template_id, from_email, from_name, to_email, to_name, subject, merge_vars, bcc ="")
      # defined in my environment
      sendgridkey = Rails.configuration.sendgridkey

      # This flag allows me to do email testing without pushing the message to SendGrid
      if Rails.configuration. sendmail

        # This was the only part that wasn’t crystal clear to me in the gem documentation
        # See my note at the end
        # Create an SMTPAPI header and put settings into it
        header = Smtpapi::Header.new
        header.add_unique_arg("rd_audit_number", audit_id)

        # Create a SendGrid recipient to add to the list
        # At this time my sendtemplate function only sends a single message but SendGrid can
        # process a list of recipients so I’ve allowed for that expansion in the future

        # Create a sendgid recipient list
        recipients = []

        recipient = SendGrid::Recipient.new(to_email)
        merge_vars.each do |mv|
          # note that I used *||* as variable delimiters because they were that way in mandril
          recipient.add_substitution('*|' + mv["name"] + '|*', mv["content"])
        end

        # Put our one and only recipient into the array of recpients
        recipients << recipient

        # Create a sendgrid template
        puts(template_id)
        template = SendGrid::Template.new(template_id)

        # Create a client
        # Note that because I don’t have a body to send I’ve made html and text blank
        # However, an empty string wouldn’t work for me so I used one space
        # Adding the smtpapi header here, this was the second half of the unclear part for me
        client = SendGrid::Client.new(api_key:  sendgridkey)
        mail_defaults = {
            smtpapi: header,
            from: from_email,
            from_name: from_name,
            to: to_email,
            to_name: to_name,
            bcc: bcc,
            html: ' ',
            text: ' ',
            subject: subject
        }

        # Create a new TemplateMailer
        mailer = SendGrid::TemplateMailer.new(client, template, recipients)

        # send it
        lres = mailer.mail(mail_defaults)

        # return the result
        res = FakeRes.new
        res.code = lres.code
        res.body = lres.body["message"]

      else
        # Rails.configuration.sendmail was set to false so fake a success return
        res = FakeRes.new
        res.code = "200"
        res.body = "success"
      end

      return res
    end #sendtemplate
  end
end
# End code