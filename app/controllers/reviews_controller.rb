class ReviewsController < ApplicationController

  def new
    @destination = Destination.find(params[:destination_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      destination_id: params[:destination_id],
      user_id: vurrent_user.id,
      body: review_params["body"]
      )
    if @review.save
      redirect_to destination_url(@review.destination)
    else
      render :new
    end
  end

private

def review_params
  params.require(:review).permit(:body)
end

end
