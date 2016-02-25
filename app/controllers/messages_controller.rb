class MessagesController < ApplicationController

  before_filter :restrict_access
  before_filter :teacher_access

  def new
    @classroom = Classroom.find(params[:classroom_id])
    @message = @classroom.messages.build
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @message = @classroom.messages.build(message_params)
    @message.teacher_id = current_user.id if current_user.is_a?(Teacher)

    if @message.save
      redirect_to @classroom, notice: "message created successfully"
    else
      render :new
    end
  end

  def destroy
    @message = message.find(params[:id])
    @message.destroy
    redirect_to classroom_path(@classroom)
  end

  protected

  def message_params
    params.require(:message).permit( :title, :text, :classroom_id)
  end

end
