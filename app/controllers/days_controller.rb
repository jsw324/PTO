class DaysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @days = Days.where(user_id:current_user.id)
    @employees = Employee.where(user_id:current_user.id)
  end

  def new
    @days = Days.new
    @day = Days.where(user_id:current_user.id)
    @employees = Employee.where(user_id:current_user.id)
  end

  def create
    @days = Days.new(days_params)
    @days.user_id = current_user.id
    @days.name = current_user.name
    @employees = Employee.find_by(user_id:current_user.id)
    @employees.daysLeft = @employees.daysLeft - @days.daysTaken
    @employees.save
    if @days.save
      redirect_to new_day_path
    else
      redirect_to day_path
    end
  end

  def show
    @days = Days.where(user_id:current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def employee_params
    params.require(:user_id).permit(:daysLeft)
  end
  def days_params
   params.require(:days).permit(:daysTaken, :daysGiven, :dateTaken, :note, :id)
  end
end
