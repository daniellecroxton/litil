class BusinessesController < ApplicationController
  before_action :require_creator, only: [:edit, :destroy]


  def search
  end

  def index
    @results = Business.search(params[:search])
  end

  def new
    @business = Business.new
    @business.build_business_rating
  end

  def edit
    @business = current_business
  end

  def show
    @business = current_business
  end

  def create

    # binding.pry
    @business = current_user.businesses.new(business_params)
    @business_rating = @business.business_rating
    @business.create_category_from_name unless business_params[:new_category_name].blank?
    respond_to do |format|
      if @business.valid?
        @business.save
        format.html { redirect_to business_path(@business), notice: "New business added." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @business = current_business
    @business_rating = BusinessRating.find_by_id(@business.business_rating_id)
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @business = current_business
    @user = current_user
    @business.destroy!
    render '/users/show', :notice => "Your business has been deleted"
  end

  private

  def current_business
    Business.find_by_id(params[:id])
  end

  def require_creator
    unless current_user.id == current_business.user_id
      flash[:error] = "You cannot make changes to a business you did not create"
      redirect_to user_path
    end
  end

  def business_params
    params.require(:business).permit(
      :name,
      :full_street_address,
      :website,
      :phone,
      :image,
      :user_id,
      :category_id,
      :new_category_name,
      :business_rating_attributes => [:rating]
    )
  end
end
