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
    tempstudent = Student.new(student_params)
    if tempstudent.valid?
      @student.update(student_params)
      redirect_to student_path(@student.id)
    else
      flash.now[:messages] = tempstudent.errors.full_messages.first
      render :edit
    end
  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save  
      redirect_to students_path
    else
      flash[:messages] = @student.errors.full_messages.first
      render :new
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
    
private

  def student_var_params(*args)
    params.require(:student).permit(*args)
  end

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
