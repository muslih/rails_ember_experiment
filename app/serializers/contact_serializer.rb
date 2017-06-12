class ContactSerializer < ActiveModel::Serializer
  attributes :id, :family_name, :given_names, :title, :phone, :email, :website, :address, :costumer_id, :additional_info
  has_one :company
  has_many :projects
end
