class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validate :uniq_gym_client_combination

  def uniq_gym_client_combination
    existing_membership = Membership.where(["client_id=? and gym_id = ?", self.client_id, self.gym_id])[0]
    
    if(!existing_membership.nil?)
      errors.add(:client_id, "client is already a member of this gym")
    end
  end
end
