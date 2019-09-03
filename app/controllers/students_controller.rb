class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save!
      redirect_to student_path(@student.id)
    else
      flash.now[:messages] = @student.errors.full_messages
      render :new
    end
    
  end

  def update
    @student = Student.find(params[:id])
    student = Student.new(student_params)
    if student.valid?
      @student.update(student_params)
      redirect_to student_path(@student.id)
    else
      flash.now[:messages] = student.errors.full_messages
      render :edit
    end

  end

  def delete
    @student =  Student.find(params[:id])
    @student.delete
    redirect_to "/students"
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
