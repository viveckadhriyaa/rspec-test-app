class User < ApplicationRecord

	validates_presence_of :first_name, :last_name, :email

	scope :active_users, -> { where(active: true) }

	scope :inactive_users, -> { where(active: false) }

end
