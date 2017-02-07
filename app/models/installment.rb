class Installment < ActiveRecord::Base
	has_one :order
	belongs_to :batch_student

end
