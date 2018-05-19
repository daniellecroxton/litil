class BusinessesController < ApplicationController

  def search
  end

  def index
    @businesses = Business.all
    @products = Product.all
    @tags = Tag.all
    @categories = Category.all
    @users = User.all
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find_by_id(params[:id])
  end

  def show
    @business = Business.find_by_id(params[:id])
  end

  def create
    redirect_to business_path(params[:id])
  end

  def create
    # raise current_user.inspect
    @business = Business.new(business_params)
    respond_to do |format|
      if @business.valid?
        # params[:id] = @business.id
        current_user.id = @business.user_id
        Category.find_or_create_by(name: params[:category][:name])
        @business.save
        raise params.inspect
        format.html { redirect_to business_path(@business), notice: "New business added." }
      else
        format.html { render :new }
        #add error message
      end
    end
  end

  def update
  end

  def delete
  end

  private

  def business_params
    params.require(:business).permit(
      :name,
      :full_street_address,
      :website,
      :phone,
      :rating,
      :image,
      :user_id,
      :category
    )
  end
end
