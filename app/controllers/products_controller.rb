class ProductsController < ApplicationController
  before_action :require_creator, only: [:edit, :destroy]


  def show
    @product = current_product
    @business = current_business
    @business_product = BusinessesProduct.find_by_product_id_and_business_id(@product.id, @business.id)
  end

  def index
  end

  def new
    @business = current_business
    @product = @business.products.new
    @businesses_products = @product.businesses_products.build
  end

  def create
    @business = current_business
    @product = @business.products.build(product_params)
    @product.businesses_products.last.business_id = @business.id
    respond_to do |format|
      if @product
        @product.create_tag_from_name unless product_params[:new_tag_name].blank?
        @product.save
        format.html { redirect_to business_path(@business), notice: "New product added." }
      else
        @product.errors.messages
        format.html { render :new }
      end
    end
  end

  def edit
    @product = current_product
    @business = current_business
  end

  def update
    @product = current_product
    @business = current_business
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
    @business = current_business
    @product.destroy!
    render '/businesses/show', :notice => "Your product has been deleted"
  end

  private

  def current_product
    Product.find_by_id(params[:id])
  end

  def current_business
    Business.find_by_id(params[:business_id])
  end

  def require_creator
    unless current_user.id == current_business.user_id
      flash[:error] = "You cannot make changes to a business you did not create"
      redirect_to user_path
    end
  end

  def product_params
    params.require(:product).permit(
      :name,
      :new_tag_name,
      :business_id,
      :tag_ids => [],
      :businesses_products_attributes => [:product_rating]
    )
  end

end
