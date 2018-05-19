class ProductsController < ApplicationController

  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
  end

  def new
    @product = Product.new
    @business = Business.find_by_id(params[:business][:id])
  end

  def create
    # raise current_user.inspect
    @product = Product.new(product_params)
    @business = Business.find_by_id(params[:business][:id])
    respond_to do |format|
      if @product.valid?
        @business << @product
        Tag.find_or_create_by(name: params[:tag][:name])
        @product.save
        raise params.inspect
        format.html { redirect_to business_path(@business), notice: "New product added." }
      else
        format.html { render :new }
        #add error message
      end
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
  end

  def delete
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :tags => [:name]
    )
  end

end
