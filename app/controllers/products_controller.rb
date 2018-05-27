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
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.valid?
        @product.create_tag_from_name unless params[:new_tag_name].blank?
        @business.products << @product
        @product.save
        # raise params.inspect

        format.html { redirect_to business_path(@business), notice: "New product added." }
      else
        @product.errors.messages
        format.html { render :new }
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
    # raise params[:product][:new_tag_name].inspect
    respond_to do |format|
      if @product.valid?
        @tag = Tag.find_or_create_by(name: params[:product][:new_tag_name])
        @product.tags << @tag
        @product.save
        format.html { redirect_to business_product_path(@business, @product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :new_tag_name,
      :tags => [:name]
    )
  end

end
