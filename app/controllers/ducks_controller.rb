class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end
  
  def show
    @duck = Duck.find(params[:id])
  end
  
  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end 
  
  def update
    @duck = Duck.find(params[:id])
    tempduck = Duck.new(duck_params)
    if tempduck.valid?
      @duck.update(duck_params)
      redirect_to duck_path(@duck.id)
    else
      flash.now[:messages] = tempduck.errors.full_messages.first
      @students = Student.all
      render :edit
    end
  end
  
  def new
    @duck = Duck.new
    @students = Student.all
  end

  def create
    @duck = Duck.new(duck_params)
    if @duck.valid?
      @duck.save
      redirect_to ducks_path
    else
      flash.now[:messages] = @duck.errors.full_messages.first
      @students = Student.all
      render :new
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.destroy
    redirect_to ducks_path
  end
    
private

  def duck_var_params(*args)
    params.require(:duck).permit(*args)
  end

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
