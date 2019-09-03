class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params)
      @duck.save
      redirect_to duck_path(@duck)
    else
      flash.now[:messages] = @duck.errors.full_messages[0]
      render :edit
    end
  end

  def new
    @duck = Duck.new
  end

  def create
    @duck = Duck.create(duck_params)
    if @duck.valid?
      @duck.save
      redirect_to duck_path(@duck)
    else
      flash.now[:messages] = @duck.errors.full_messages[0]
      render :new
    end
  end

  private

  def duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
