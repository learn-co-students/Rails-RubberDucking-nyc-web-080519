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
   @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      flash[:messages] = @student.errors.full_messages
      render :new 
    end 
  end 

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else 
      flash[:messages] = @student.errors.full_messages
      render :edit 
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
