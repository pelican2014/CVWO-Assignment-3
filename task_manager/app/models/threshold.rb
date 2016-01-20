class Threshold < ActiveRecord::Base
	validates :value, presence: true, numericality: { only_integer: true }
end
