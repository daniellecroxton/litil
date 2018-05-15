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
  end

  def show
  end

  def create
    redirect_to business_path(params[:id])
  end

  def create
    # raise params.inspect
    @business = Business.new(params)
    respond_to do |format|
      if @business.save
        params[:id] = @business.id
        format.html { redirect_to business_path(@business), notice: "New business added." }
      else
        format.html { render :new }
      end
    end
  end

  def update
  end

  def delete
  end

end
