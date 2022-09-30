class CommentsController < ApplicationController

  def new
    @coursemodule = CourseModule.find(params[:id])
    @comment = Comment.new
  end

  def create
    @coursemodule = CourseModule.find(params[:id])
    @review_params = params.require(:comment).permit(:title, :content)
    @review_params[:course_module] = @coursemodule
    @comment = current_user.comments.create(@review_params)
    
    if @comment.save
      redirect_to course_modules_show_path(:id => @coursemodule.id), notice: 'comment created succesfully'
    else
      redirect_to course_modules_show_path(:id => @coursemodule.id), notice: "Error while creating the comment "
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comments_new_params = params.require(:comment).permit(:title, :content)

    if @comment.update(@comments_new_params)
      redirect_to course_modules_show_path(:id => @comment.course_module.id), notice: 'Comment edited'
    else
      redirect_to course_modules_show_path(:id => @comment.course_module.id), notice: 'Comment edit failed'
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @course_module_id = @comment.course_module.id
    @comment.destroy

    redirect_to course_modules_show_path(:id => @course_module_id), notice: 'Comment deleted'
  end

end
