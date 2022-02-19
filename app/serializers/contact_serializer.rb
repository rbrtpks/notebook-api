class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind do
    link(:kind) { kind_url(object.kind.id) }
  end
  
  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }
  link(:kind) { kind_url(object.kind.id) }

  # def author
  #   "Jackson Pires"
  # end

  meta do
    { author: "Jackson Pires" }
  end

  def attributes(*args)
    hash = super(*args)
    # hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) #pt-BR
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end
end
