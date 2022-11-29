class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_count

  def membership_count
    self.object.memberships.length
  end
end
