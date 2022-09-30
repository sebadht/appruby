class CoursesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @course = Course.new
  end

  def create
    @user = User.find(params[:id])
    @course_params = params.require(:course).permit(:name, :description, :category)
    @course = @user.courses.create(@course_params)
    
    if @course.save
      redirect_to courses_index_path, notice: 'Course created succesfully'
    else
      render :new
    end
  end

  def index
    @courses = Course.search(params[:search])
  end

  def show
    @course = Course.find(params[:id])
    @inscription = Inscription.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @courses_new_params = params.require(:course).permit(:name, :description, :category)

    if @course.update(@courses_new_params)
      redirect_to courses_show_path(:id => @course.id), notice: 'Course edited'
    else
      redirect_to courses_show_path(:id => @course.id), notice: 'Course edit failed'
    end
  end

  def delete
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_index_path, notice: 'Course deleted'
  end
  
end
