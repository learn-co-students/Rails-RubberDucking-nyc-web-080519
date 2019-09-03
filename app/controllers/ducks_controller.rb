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

  def create
    @duck = Duck.new(duck_params)
    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck.id)
    else
      flash.now[:messages] = @duck.errors.full_messages
      render :new
    end
  end

  def edit
    @duck = Duck.find(params[:id])
    @students = Student.all
  end

  def update
    @students = Student.all
    @duck = Duck.find(params[:id])
    temp_duck = Duck.new(duck_params)
    if temp_duck.valid?
      @duck.update(duck_params)
      redirect_to duck_path(@duck.id)
    else
      flash.now[:messages] = temp_duck.errors.full_messages
      render :edit
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.delete
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :mod)
  end

end
