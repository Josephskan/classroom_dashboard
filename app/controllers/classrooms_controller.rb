class ClassroomsController < ApplicationController

  before_filter :restrict_access

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    num = (100_000 + Random.rand(1_000_000 - 100_000))
    @classroom.passcode = num

    if @classroom.save
      redirect_to classroom_path(@classroom)
    else
      render :new
    end
  end

  def show
  end

  def index
    @classrooms = Classroom.all
  end

  protected

  def classroom_params
    params.require(:classroom).permit( :classroom_name, :passcode)
  end

end
