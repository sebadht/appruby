class CourseModulesController < ApplicationController

  def new
    @course = Course.find(params[:id])
    @course_module = CourseModule.new
  end

  def create
    @course = Course.find(params[:id])
    @coursemodule_params = params.require(:course_module).permit(:title, :description, :video, :sheet, :image)
    @coursemodule = @course.course_modules.create(@coursemodule_params)
    if @coursemodule.save
      redirect_to courses_show_path(:id => @course.id), notice: 'Class created succesfully'
    else
      redirect_to courses_show_path(:id => @course.id), notice: 'Error while creating the module'
    end
  end

  def index
  end

  def show
    @coursemodule = CourseModule.find(params[:id])
    @comment = Comment.new
    @reply = Reply.new
  end

  def edit
    @coursemodule = CourseModule.find(params[:id])
  end

  def update
    @coursemodule = CourseModule.find(params[:id])
    @coursemodule_new_params = params.require(:course_module).permit(:title, :description, :video, :sheet, :image)

    if @coursemodule.update(@coursemodule_new_params)
      redirect_to courses_show_path(:id => @coursemodule.course.id), notice: 'Module edited'
    else
      redirect_to courses_show_path(:id => @coursemodule.course.id), notice: 'Module edit failed'
    end
  end

  def delete
    @coursemodule = CourseModule.find(params[:id])
    @course = @coursemodule.course
    @coursemodule.destroy

    redirect_to courses_show_path(:id => @course.id), notice: 'Module deleted'
  end
end
