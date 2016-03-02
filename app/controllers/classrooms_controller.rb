class ClassroomsController < ApplicationController

  before_filter :restrict_access
  before_filter :teacher_access, only: [:new, :create, :destroy]

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    num = (100_000 + Random.rand(1_000_000 - 100_000))
    @classroom.passcode = num
    @classroom.teacher = @current_user

    if @classroom.save
      redirect_to classroom_path(@classroom)
    else
      render :new
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to classrooms_path
  end

  protected

  def classroom_params
    params.require(:classroom).permit( :classroom_name, :passcode)
  end

  def check_valid_membership(classroom)
  end

end
