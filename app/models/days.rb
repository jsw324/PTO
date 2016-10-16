class Days < ActiveRecord::Base
  belongs_to :employees
  accepts_nested_attributes_for :employees
end
