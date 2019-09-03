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
    @duck = Duck.new(duck_params)
    @students = Student.all
    if @duck.save
      redirect_to duck_url(duck)
    else
      flash.now[:errors] = @duck.errors.full_messages
      render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
      redirect_to duck_url(duck)
    else
      flash.now[:errors] = @duck.errors.full_messages
      render :edit
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
