class BusinessesController < ApplicationController

  def search
  end

  def index
    @results = Business.search(params[:search])
    # @businesses = Business.all
    # @products = Product.all
    # @tags = Tag.all
    # @categories = Category.all
    # @users = User.all
  end

  def new
    @business = Business.new
  end

  def edit
    @business = current_business
  end

  def show
    @business = current_business
  end

  def create
    # raise current_user.inspect
    @business = current_user.businesses.new(business_params)
    # raise business_params.inspect
    respond_to do |format|
      if @business.valid?
        @business.create_category_from_name unless params[:new_category_name].blank?
        @business.save
        format.html { redirect_to business_path(@business), notice: "New business added." }
      else
        format.html { render :new }
        #add error message
      end
    end
  end

  def update
    @business = current_business

    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
  end

  private

  def current_business
    Business.find_by_id(params[:id])
  end

  def business_params
    params.require(:business).permit(
      :name,
      :full_street_address,
      :website,
      :phone,
      :rating,
      :image,
      :user_id,
      :category_id,
      :new_category_name
    )
  end
end
