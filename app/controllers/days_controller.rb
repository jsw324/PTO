class DaysController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @days = Days.new
  end

  def new
    @days = Days.new
  end

  def create
    @days = Days.new(days_params)
    if @days.save && !@days.nil?
      redirect_to days_index_path
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
   params.require(:name).permit(:daysGiven, :daysTaken, :dateTaken)
  end
end
