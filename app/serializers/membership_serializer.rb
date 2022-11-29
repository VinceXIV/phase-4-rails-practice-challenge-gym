class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :charge
  has_one :client
  has_one :gym
end
