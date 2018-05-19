class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
    #make current_product helper method
    respond_to do |format|
      if @tag.save
        current_product << @tag
        format.html { redirect_to product_path(current_product), notice: "Tag added." }
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
