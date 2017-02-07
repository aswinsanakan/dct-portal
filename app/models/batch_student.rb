class BatchStudent < ActiveRecord::Base

	has_many :installments
	has_many :payment_links

	belongs_to :user
	belongs_to :batch
end
