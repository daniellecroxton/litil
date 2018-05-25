class ProductsController < ApplicationController

  def show
    @product = Product.find_by(id: params[:id])
    @business = Business.find_by_id(params[:business_id])
  end

  def index
  end

  def new
    @product = Product.new
    @business = Business.find_by_id(params[:business_id])
  end

  def create
    # raise current_user.inspect
    @business = Business.find_by_id(params[:business_id])
    @product = @business.products.new(product_params)

    respond_to do |format|
      # raise params.inspect

      if @product.valid?

        Tag.find_or_create_by(name: params[:tag][:name])
        @product.save
        # raise params.inspect
        format.html { redirect_to business_path(@business), notice: "New product added." }
      else
        @product.errors.messages
        format.html { render :new }
        #add error message
      end
    end
  end

  def edit
    @product = Product.find_by_id(params[:id])
    @business = Business.find_by_id(params[:business_id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    @business = Business.find_by_id(params[:business_id])

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
