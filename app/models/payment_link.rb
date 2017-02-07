class PaymentLink < ActiveRecord::Base
	belongs_to :batch_student
	
	before_create :set_not_expired

	private

	def set_not_expired
		self.is_expired = false
	end
end
