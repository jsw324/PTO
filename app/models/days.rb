class Days < ActiveRecord::Base
  belongs_to :users

  def subtract(left, taken)
    left -= taken
    return left
  end
end
