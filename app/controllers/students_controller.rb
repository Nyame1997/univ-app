class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save 
      session[:student_id] = @student.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your account!"
      redirect_to @student
    else
      render 'edit'
    end
  end

  # DELETE /students/1 or /students/1.json
  # def destroy
  #   @student.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password)
    end
    
    def require_same_user
      if current_user != @student
        flash[:notice] = "You can only edit your own profile!"
        redirect_to student_path(current_user)
      end
    end
    
end
