class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show 
    @student = Student.find(params[:id])
  end 

  def new
    @student = Student.new
  end

  def create
    if Student.create(student_params)
      redirect_to students_path 
    else
      render :new 
    end 
  end 

  def edit
    @student = Student.find(params[:id])
  end

  def update
    if student = Student.find(params[:id])
      student.update(student_params)
      redirect_to student_path(student)
    else 
      render :edit 
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
