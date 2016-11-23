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
    @users = User.all
  end

  def admin
    @user = current_user
    if @user.admin == true
      @days = Days.all
      @users = User.all
    else
      redirect_to new_day_path
    end
  end

  def adminShow
    @user = current_user
    if @user.admin == true
      @days = Days.where(id_param)
      @users = User.all
    else
      redirect_to new_day_path
    end
  end

  def edit
      @days = Days.find_by("id" => id_param[:id])
    end

    def update
      @days = Days.find_by("id" => id_param[:id])
      if @days.update(days_params)
        redirect_to days_path
      else
        redirect_to days_path
      end
    end

    def destroy
      @days = Days.destroy(params[:id])
      ## need to add back deleted days.
      @day = Days.last
      @day.daysLeft += @days.daysTaken
      if @days.save
        redirect_to @days
      end
    end


  private

  def days_params
   params.require(:days).permit(:daysTaken, :daysLeft, :dateTaken, :note, :id)
  end

  def id_param
    params.permit(:id, :user_id)
  end
end
