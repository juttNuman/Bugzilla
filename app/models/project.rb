class Project < ApplicationRecord
has_many :collaborations, dependent: :destroy
has_many :users , through: :collaborations
accepts_nested_attributes_for :collaborations
has_many :bugs, dependent: :destroy

end
