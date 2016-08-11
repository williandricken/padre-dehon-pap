class EmailController < ApplicationController
  def index
  end

  def subscribe

    list_id = "51c1564989"


    Gibbon::Request.new.lists(list_id).members.create(body:
                                                      {email_address: params[:email][:address], status: "subscribed",
                                                       merge_fields: {FNAME: "First Name", LNAME: "Last Name"}})

    render :index
  rescue Gibbon::MailChimpError => e
    if e.title == "Member Exists"
      flash[:info] = "Membro já cadastrado!!!"
      render :index
    end
  end
end
