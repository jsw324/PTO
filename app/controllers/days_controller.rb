class DaysController < ApplicationController
  def index
    @days = Days.new
  end

  def new
    @days = Days.new
  end

  def create
    @days = Days.new(pto_params)
    if @days.save && !@days.nil?
      redirect_to pto_index_path
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
  def pto_params
   params.require(:name).permit(:daysGiven, :daysTaken, :dateTaken)
  end
end
