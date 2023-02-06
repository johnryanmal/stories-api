class Story < ApplicationRecord
	belongs_to :user

	def public?
		public ? true : false
	end
end
