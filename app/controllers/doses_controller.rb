class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params['cocktail_id'].to_i)
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create

    @cocktail = Cocktail.find(params['cocktail_id'].to_i)
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
