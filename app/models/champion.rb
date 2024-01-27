class Champion < ApplicationRecord
    validates :name, presence: true
    validates :championType, presence: true
    validates :difficulty, presence: true
    validates :price, presence: true
end
