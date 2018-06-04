class ProductsController < ApplicationController

  def show
    @product = current_product
    @business = Business.find_by_id(params[:business_id])
    @business_product = BusinessesProduct.find_by_product_id_and_business_id(@product.id,@business.id)
  end

  def index
  end

  def new
    @business = Business.find_by_id(params[:business_id])
    @product = @business.products.new
    @businesses_products = @product.businesses_products.build
  end

  def create
    @business = Business.find_by_id(params[:business_id])
    @product = @business.products.create(product_params)
    # binding.pry
    # raise product_params.inspect
    respond_to do |format|
      if @product.save
        @product.create_tag_from_name unless product_params[:new_tag_name].blank?
        # @product.tags.build(product_params[:tag_ids])
        @business.products << @product
        @product.save
        # binding.pry
        # @product.businesses_products = params[:businesses_products]
        format.html { redirect_to business_path(@business), notice: "New product added." }
      else
        @product.errors.messages
        format.html { render :new }
      end
    end
  end

  def edit
    @product = current_product
    @business = Business.find_by_id(params[:business_id])
  end

  def update
    @product = current_product
    @business = Business.find_by_id(params[:business_id])
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

  def destroy
    @product = current_product
    @business = Business.find_by_id(params[:business_id])
    @product.destroy!
    render '/businesses/show', :notice => "Your product has been deleted"
  end

  private

  def current_product
    Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :new_tag_name,
      :tag_ids => [],
      :businesses_products_attributes => [:product_rating]
    )
  end

end
