class Campaign
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :plain_email_content, :email_content, :html_content, :sender_id, :subject,
      :title, :custom_unsubscribe_url #, list_ids: [], categories: []

  # validates :whatever, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end