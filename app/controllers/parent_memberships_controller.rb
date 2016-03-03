class ParentMembershipsController < ApplicationController

  before_filter :restrict_access
  before_filter :parent_access

  def new
    @parent_membership = ParentMembership.new
    @classroom = Classroom.find(params[:classroom_id])
  end

  def create
    @parent_membership = ParentMembership.new(
      classroom_id: params[:classroom_id],
      parent_id: @current_user.id
      )
    @classroom = Classroom.find(params[:classroom_id])
    @code = @classroom.passcode

    if params[:passcode].to_i == @code
      if @parent_membership.save
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
