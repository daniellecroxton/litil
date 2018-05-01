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
end
