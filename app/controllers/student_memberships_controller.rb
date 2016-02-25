class StudentMembershipsController < ApplicationController

  before_filter :restrict_access
  before_filter :student_access

  def new
    @student_membership = StudentMembership.new
  end

  def create
    @student_membership = StudentMembership.new(
      classroom_id: params[:classroom_id],
      student_id: @current_user.id
      )
    @classroom = Classroom.find(params[:classroom_id])
    @code = @classroom.passcode

    if params[:passcode].to_i == @code
      if @student_membership.save
        redirect_to classroom_path(@classroom)
      else
        render :new
      end
    else
      render :new
    end  

  end

  def destroy
    @student_membership = StudentMembership.find(params[:id])
    @student_membership.destroy
    redirect_to classrooms_path
  end

end
