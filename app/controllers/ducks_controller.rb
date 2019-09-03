class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end
  
  def show
    @duck = Duck.find(params[:id])
  end 

  def new 
    @duck = Duck.new 
    @students = Student.all
  end

  def create
    if Duck.create(duck_params)
      redirect_to ducks_path 
    else  
      render :new 
    end 
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    if duck = Duck.find(params[:id])
      duck.update(duck_params)
      redirect_to duck_path(duck)
    else 
      render :edit 
    end 
  end

  def destroy 
    duck = Duck.find(params[:id])
    duck.destroy
    redirect_to ducks_path 
  end 

  

  private 

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end


end
