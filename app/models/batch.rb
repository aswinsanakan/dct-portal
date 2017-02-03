class Batch < ActiveRecord::Base
	has_many :batch_students
	has_many :users, through: :batch_students

	has_many :installments

	belongs_to :course
end
