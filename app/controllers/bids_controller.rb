class BidsController < ApplicationController
  before_action :set_bid, except: [:new, :create]

  def new
    @listing = Listing.find(params[:id])
    @bid = @listing.bids.build
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @bid = @listing.bids.build bid_params
    if params && @bid.save
      redirect_to @listing, notice: "bid was successfully created"
    else
      redirect_to :back, notice: "must enter an amount"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @listing = Listing.find(params[:id])
    @bids = @listing.bids.all.order("created_at DESC")
  end

  def destroy
    @bid.destroy
    redirect_to :back, notice: "bid destroyed"
  end

  private

  def bid_params
    params.require(:bid).permit(:listing_id, :user_id, :amount)
  end

  def set_bid
    @bid = Bid.find(params[:id])
  end
end
