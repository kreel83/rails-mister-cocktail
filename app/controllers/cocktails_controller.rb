class CocktailsController < ApplicationController

  def destroy
    @cocktail = Cocktail.find(params[:id].to_i)
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id].to_i)
    @ingredients = Ingredient.all
    @review = Review.new
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(params_cocktail)
    if @cocktail.save

      redirect_to cocktails_path
    else
      render :new
    end

  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end



end
