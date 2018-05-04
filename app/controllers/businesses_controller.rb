class BusinessesController < ApplicationController
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
  end

  def update
  end

  def delete
  end
  
end
