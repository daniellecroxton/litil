class ProductsController < ApplicationController

  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
  end

  def delete
  end

end
