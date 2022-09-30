class RepliesController < ApplicationController
  def new
    @coursemodule = CourseModule.find(params[:id])
    @reply = Reply.new
  end

  def create
    @comment = Comment.find(params[:id])
    @reply_params = params.require(:reply).permit(:content)
    @reply_params[:comment] = @comment
    @reply = current_user.replies.create(@reply_params)
    
    if @reply.save
      redirect_to course_modules_show_path(:id => @comment.course_module.id), notice: 'reply created succesfully'
    else
      redirect_to course_modules_show_path(:id => @comment.course_module.id), notice: "Error while creating the reply "
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    @replies_new_params = params.require(:reply).permit(:content)

    if @reply.update(@replies_new_params)
      redirect_to course_modules_show_path(:id => @reply.comment.course_module.id), notice: 'Reply edited'
    else
      redirect_to course_modules_show_path(:id => @reply.comment.course_module.id), notice: 'Reply edit failed'
    end
  end

  def delete
    @reply = Reply.find(params[:id])
    @course_module_id = @reply.comment.course_module.id
    @reply.destroy

    redirect_to course_modules_show_path(:id => @course_module_id), notice: 'Reply deleted'
  end
end
