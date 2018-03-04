class ReviewsController < ApplicationController

  before_filter :authorize, only: [:create]

  def create
    @review = Review.new review_params
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

end