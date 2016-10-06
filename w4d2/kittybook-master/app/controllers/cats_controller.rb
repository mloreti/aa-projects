class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end


  def show
    @cat = Cat.find(params[:id])
    @rentals = CatRental.all.where(cat_id: @cat.id)
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat.id)
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      render :show
    else
      render(
        text: @cat.errors.full_messages
      )
    end
  end

  def destroy
    Cat.find(params[:id]).destroy!

    redirect_to cats_url
  end
  private

  def cat_params
    params.require(:cat).permit(:birth_date, :name, :color, :sex, :description)
  end
end
