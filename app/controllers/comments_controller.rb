class CommentsController < ApplicationController

  before_filter :restrict_access
  before_filter :find_classroom_and_message, only: [:new, :create, :index]

  def new
    @comment = @message.comments.build
  end

  def create
    @comment = @message.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @classroom, notice: "comment created successfully"
    else
      render :new
    end
  end

  def index
    @comments = Comments.all.where("classroom_id = ? AND message_id = ?", @classroom, @message)
    respond_to do |format|
      format.html
      format.json { render json: @comments}
    end
  end

  def destroy
  end

  protected

  def find_classroom_and_message
    @classroom = Classroom.find(params[:classroom_id])  
    @message = Message.find(params[:message_id])
  end

  def comment_params
    params.require(:comment).permit( :text, :message_id)
  end

  # def new
  #   @classroom = Classroom.find(params[:classroom_id])
  #   @message = @classroom.messages.build
  # end

  # def create
  #   @classroom = Classroom.find(params[:classroom_id])
  #   @message = @classroom.messages.build(message_params)
  #   @message.teacher_id = current_user.id if current_user.is_a?(Teacher)

  #   if @message.save
  #     binding.pry
  #     redirect_to @classroom, notice: "message created successfully"
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @message = message.find(params[:id])
  #   @message.destroy
  #   redirect_to classroom_path(@classroom)
  # end

  # protected

  # def message_params
  #   params.require(:message).permit( :title, :text, :classroom_id)
  # end
end
