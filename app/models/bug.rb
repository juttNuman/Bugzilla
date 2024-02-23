class Bug < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :project_id }
  belongs_to :user, optional: true
  belongs_to :project

  enum category: {feature: 0, bug: 1}
  enum status: { newly: 0, started: 1, completed: 2, resolved: 3 }

  def self.ransackable_attributes(_auth_object = nil)
    "%w(title)" "%w(status)"
  end
  
end
