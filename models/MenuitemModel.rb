class Menuitem < ActiveRecord::Base

 	has_many :orders, dependent: :destroy

	has_many :waiters, through: :orders

end	