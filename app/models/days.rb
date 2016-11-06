class Days < ActiveRecord::Base
  belongs_to :users

  def subtract(left, taken)
    left = left - taken
    return left
  end
end
