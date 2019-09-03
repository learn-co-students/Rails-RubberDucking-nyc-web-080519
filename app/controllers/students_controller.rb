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
    byebug
    student = Student.new(student_params)
    byebug
    if student.save
      byebug
      redirect_to student_url(student)
    else
      flash.now[:errors] = student.errors.full_messages
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      redirect_to student_url(student)
    else
      flash.now[:errors] = student.errors.full_messages
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
