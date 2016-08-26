class EmailController < ApplicationController
  def index
  end

  def subscribe

    list_id = "51c1564989"

    res = Responsible.last


    Gibbon::Request.new.lists(list_id).members.create(body:
                                                      {email_address: res.user.email, status: "subscribed",
                                                       merge_fields: {NAME: res.name,
                                                                      PASSWORD: res.cpf,
                                                                      AGE: 20}})

    render :index
  rescue Gibbon::MailChimpError => e
    if e.title == "Member Exists"
      flash[:info] = "Membro já cadastrado!!!"
    end
    render :index
  end
end