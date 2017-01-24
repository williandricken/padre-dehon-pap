class TransactionalEmail
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :to, :from, :subject, :content, :template_id
      #:title, substitutions: []

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

# to: willian@ebanx.com
# from: williandricken@.com
# template
# subject
# content
# substitutions fields

# o template ja tem as variaveis que recebem os valores dinamicos da aplicação
# os valores, como serão definidos?