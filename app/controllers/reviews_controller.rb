class ReviewsController < ApplicationController
  
  def new
    @course = Course.find(params[:id])
    @review = Review.new
  end

  def create
    @course = Course.find(params[:id])
    @review_params = params.require(:review).permit(:title, :description, :score)
    @review_params[:course] = @course
    @review = current_user.reviews.create(@review_params)
    
    if @review.save
      redirect_to reviews_index_path(:id => @course.id), notice: 'review created succesfully'
    else
      redirect_to reviews_index_path(:id => @course.id), notice: "Error while creating the review "
    end
  end

  def index
    @course = Course.find(params[:id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @reviews_new_params = params.require(:review).permit(:title, :description, :score)

    if @review.update(@reviews_new_params)
      redirect_to reviews_index_path(:id => @review.course.id), notice: 'Review edited'
    else
      redirect_to reviews_index_path(:id => @review.course.id), notice: 'Review edit failed'
    end
  end

  def delete
    @review = Review.find(params[:id])
    @course_id = @review.course.id
    @review.destroy

    redirect_to reviews_index_path(:id => @course_id), notice: 'Review deleted'
  end
end
