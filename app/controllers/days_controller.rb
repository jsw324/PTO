class DaysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @days = Days.where(user_id:current_user.id)
  end

  def new
    @days = Days.new
    @day = Days.where(user_id:current_user.id)
  end

  def create
    @days = Days.new(days_params)
    @days.user_id = current_user.id
  
    if @days.save
      redirect_to new_day_path
    else
      redirect_to home_index_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def days_params
   params.require(:days).permit(:daysTaken, :daysGiven, :dateTaken, :note, :id)
  end
end
