class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params['cocktail_id'].to_i);
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params['cocktail_id'].to_i);
    @review = Review.new(strong_review)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def strong_review
    params.require(:review).permit(:content, :rating)
  end
end
