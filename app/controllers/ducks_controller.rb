class DucksController < ApplicationController

  def index
    if params[:search]
      @ducks = Duck.all.select do |duck|
        duck.name.include?(params[:search])
      end
    else
      @ducks = Duck.all
    end
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
    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck)
    else
      @students = Student.all
      flash.now[:messages] = @duck.errors.full_messages[0]
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
      redirect_to duck_path(@duck)
    else
      flash.now[:messages] = @duck.errors.full_messages[0]
      @students = Student.all
      render :edit
    end
  end

  def destroy
    @duck = Duck.find(params[:id])
    @duck.destroy
    redirect_to ducks_path
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id, :search)
  end

end
