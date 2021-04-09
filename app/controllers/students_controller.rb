class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

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
      flash[:notice] = "You have successfully signed up!"
      redirect_to students_path
    else
      render 'new'
    end
  end

  def update
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
      params.require(:student).permit(:name, :email)
    end
end
