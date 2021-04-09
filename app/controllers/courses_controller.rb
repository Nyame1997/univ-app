class CoursesController < ApplicationController
    
    skip_before_action :require_user, only: [:index]
    
    def index
        @courses = Course.all
    end
    
    
    def new
        @course = Course.new
    end
    
    
    def create
        @course = Course.new(course_params)
        if @course.save 
          flash[:notice] = "You have successfully signed up!"
          redirect_to courses_new_path
        else
          render 'new'
        end
    end
    
    private
    
    def course_params
        params.require(:courses).permit(:short_name, :name, :description)
    end
end
