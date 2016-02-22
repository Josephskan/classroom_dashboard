class UsersController < ApplicationController

  before_action :set_user, only: [ :destroy ]
  before_action :set_type

  def new
    @user = type_class.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to classrooms_path
    else
      render :new
    end
  end

  protected

  def set_type 
    @type = type
  end

  def type
    User.types.include?(params[:type]) ? params[:type] : 'User'
  end

  def type_class
    type.constantize
  end

  def set_user
    @user = type_class.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :type, :password, :password_confirmation) 
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