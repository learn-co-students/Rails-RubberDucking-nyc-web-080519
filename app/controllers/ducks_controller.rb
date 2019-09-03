class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def create
    @duck = Duck.create(duck_params)
    redirect_to duck_path(@duck.id)
  end

  def update
    @students = Student.all
    @duck = Duck.find(params[:id])
    duck = Duck.new(duck_params)
    if duck.valid?
      @duck.update(duck_params)
      redirect_to duck_path(@duck.id)
    else
      flash.now[:messages] = duck.errors.full_messages
      render :edit
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.delete
    redirect_to "/ducks"
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

  
end
