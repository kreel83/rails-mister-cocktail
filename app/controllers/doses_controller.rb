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

      render :template => 'cocktails/show'
    end
  end


  def destroy
    @dose = Dose.find(params[:id].to_i)
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
