class CatRentalsController < ApplicationController

  def index
    redirect_to new_cat_rental_url
  end
  def create
    @rentals = CatRental.all
    @cat = CatRental.new(cat_rental_params)
    if @cat.save
      redirect_to cats_url
    end

  end

  def destroy

  end

  def cat_rental_params
    params.require(:cat_rental).permit(:cat_id, :start_date, :end_date)
  end

end
