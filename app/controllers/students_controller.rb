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

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student.id)
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
    temp_student = Student.new(student_params)
    if temp_student.valid?
      @student.update(student_params)
      redirect_to student_path(@student.id)
    else
      flash.now[:messages] = temp_student.errors.full_messages
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.delete
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
