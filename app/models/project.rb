class Project < ApplicationRecord
has_many :collaborations, dependent: :destroy
has_many :users , through: :collaborations
accepts_nested_attributes_for :collaborations, reject_if: :all_blank, allow_destroy: true
has_many :bugs, dependent: :destroy
validates :name, uniqueness: true

validate :unique_users_within_project

  def unique_users_within_project
    # Check if there are any duplicate user_ids within the project's collaborations
    if collaborations.map(&:user_id).uniq.size != collaborations.size
      errors.add(:base, "Users assigned to the project must be unique.")
    end
  end


def self.ransackable_attributes(_auth_object = nil)
    %w(name)
  end
  

end
