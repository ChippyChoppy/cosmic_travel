class Planet < ApplicationRecord
    has_many :missions
    has_many :scientists, through: :missions

     validates :name, uniqueness: true

end
