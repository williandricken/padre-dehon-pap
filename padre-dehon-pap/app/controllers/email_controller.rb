class EmailController < ApplicationController
  include SendGridMailer
  def index
      @templates = get_all_templates
      # @campaign = {plain_email_content: "", email_content: "", sender_id: 61578, subject: "",
      # title: "", segment_ids: [],   categories: ["tes","tsss"], lists: [553385]}
      @campaign = {plain_email_content: "", email_content: "", sender_id: 61578, subject: "",
      title: "", categories: "", list: 553385}

      @campaign = Campaign.new
      return @templates, @campaign
  end
  
  def template
      render html: get_template(params[:id]).html_safe
  end

  def create_campaign
    @campaign = Campaign.new(campaign_params)

    raise @campaign.to_json

    flash[@campaign]

    render :index

    # data = JSON.parse('{
    #   "categories": [
    #     "spring line"
    #   ],
    #   "custom_unsubscribe_url": "",
    #   "html_content": "<html><head><title></title></head><body><p>Check out our spring line!</p></body></html>",
    #   "ip_pool": "marketing",
    #   "list_ids": [
    #     110,
    #     124
    #   ],
    #   "plain_content": "Check out our spring line!",
    #   "segment_ids": [
    #     110
    #   ],
    #   "sender_id": 124451,
    #   "subject": "New Products for Spring!",
    #   "suppression_group_id": 42,
    #   "title": "March Newsletter"
    # }')
  end

  private   

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:plain_email_content, :email_content, :sender_id, :subject,
      :title, segment_ids: [], categories: [], lists: [])
    end

  # def subscribe

  #   list_id = "51c1564989"

  #   res = Responsible.last


  #   Gibbon::Request.new.lists(list_id).members.create(body:
  #                                                     {email_address: res.user.email, status: "subscribed",
  #                                                      merge_fields: {NAME: res.name,
  #                                                                     PASSWORD: res.cpf,
  #                                                                     AGE: 20}})

  #   render :index
  # rescue Gibbon::MailChimpError => e
  #   if e.title == "Member Exists"
  #     flash[:info] = "Membro já cadastrado!!!"
  #   end
  #   render :index
  # end

end