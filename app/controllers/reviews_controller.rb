class ReviewsController < ApplicationController
  before_action do
    @purchase = Purchase.find(params[:purchase_id])

    case action_name.to_sym
    when :new, :create
      @review = @purchase.reviews.new
    when :show
      @review = @purchase.reviews.find(params[:id])
    end
  end

  def new
    #@review.assign_attributes(review_params)
  end

  def create
    # TODO: Create the record in database
    #raise "TODO: Save to database: #{review_params}"
    @review.assign_attributes(review_params)
    if @review.save
      redirect_to product_purchase_url(@purchase.product_id, @purchase.id)
    else
      flash[:error] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

  private
    def review_params
     # params.require(:review).permit(:purchase_id)
     params.require(:review).permit(:rating, :comment)
    end
end
