class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    @products = Product.all
    @tags = Tag.all
    @categories = Category.all
    @user = User.all
  end
end
