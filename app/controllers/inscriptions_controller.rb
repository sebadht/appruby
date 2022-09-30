class InscriptionsController < ApplicationController

  def index
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.find(params[:id])
    @inscription = Inscription.create(user: current_user, course: @course)
    if @inscription.save
      redirect_to courses_show_path(:id => @course.id)
    end
  end

  def delete
    @course = Course.find(params[:id])
    @inscription = Inscription.find_by(user: current_user, course: @course)
    @inscription.destroy

    redirect_to courses_show_path(:id => @course.id), notice: 'Uninscribed'
  end

end
