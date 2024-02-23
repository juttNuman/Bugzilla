class Project < ApplicationRecord
has_many :collaborations, dependent: :destroy
has_many :users , through: :collaborations
accepts_nested_attributes_for :collaborations, reject_if: :all_blank, allow_destroy: true
has_many :bugs, dependent: :destroy
validates :name, uniqueness: true

def self.ransackable_attributes(_auth_object = nil)
    %w(name)
  end
  

end
