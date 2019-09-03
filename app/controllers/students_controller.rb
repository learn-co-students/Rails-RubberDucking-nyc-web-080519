class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      @student.save
      redirect_to student_path(@student)
    else
      flash.now[:messages] = @student.errors.full_messages[0]
      render :edit
    end    
  end


  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      flash.now[:messages] = @student.errors.full_messages[0]
      render :new
    end    
  end

  private

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
