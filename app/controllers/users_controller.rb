class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry

    if @user.save
      session[:user_id] = @user.id
      redirect_to classrooms_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:username, :name, :email, :status, :password, :password_confirmation) 
  end
end

# class TeachersController < UsersController

#   def create
#     @teacher = Teacher.new(teacher_params)

#     if @teacher.save
#       session[:teacher_id] = @teacher.id
#     end
#   end

#   protected

#   def teacher_params
#     params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
#   end
# end

# class StudentsController < UsersController

#   def create
#     @student = Student.new(student_params)

#     if @student.save
#       session[:student_id] = @student.id
#     end
#   end

#   protected

#   def student_params
#     params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
#   end
# end

# class ParentsController < UsersController

#   def create
#     @parent = Parent.new(parent_params)

#     if @parent.save
#       session[:parent_id] = @parent.id
#     end
#   end

#   protected

#   def parent_params
#     params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
#   end
# end