class DaysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @days = Days.where(user_id:current_user.id).last
  end

  def new
    @day = Days.where(user_id:current_user.id).last
    @days = Days.new
  end

  def create
    @days = Days.new(days_params)
    @days.user_id = current_user.id
    @days.name = current_user.name
    @day = Days.where(user_id:current_user.id).last
    @days.daysLeft = @day.daysLeft - @days.daysTaken.to_i
    @day.save
    if @days.save
      redirect_to new_day_path
    else
      redirect_to day_path
    end
  end

  def show
    @days = Days.where(user_id:current_user.id)
  end

  def admin
    @user = current_user
    if @user.admin == true
      @days = Days.all
    else
      redirect_to new_day_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def days_params
   params.require(:days).permit(:daysTaken, :daysLeft, :dateTaken, :note, :id)
  end
end
