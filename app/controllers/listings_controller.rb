class ListingsController < ApplicationController
  include ApplicationHelper

  before_action :set_listing, only: [:edit, :update, :show, :destroy]
  def new
    @listing = Listing.new
  end

  def create
    @listing  = Listing.new listing_params
    ## collect data from JQuery datepicker and convert to valid Ruby DateTime object
    @listing.end_time    = parse_time(params[:listing][:end_time])
    @listing.start_time  = parse_time(params[:listing][:start_time])
    @listing.condition   = convert_condition(params[:listing][:condition])
    if @listing.save
      redirect_to @listing, notice: "listing was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @bid = @listing.bids.build
    @bids = @listing.bids.all
  end

  def index
    @listings = Listing.paginate(page: params[:page], :per_page => 15).order("end_time ASC")
    @user = User.new
  end

  def destroy
    @listing.destroy
    redirect_to :back, notice: "Listing deleted."
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :condition, :user_id, :start_time, :end_time)
  end
end
