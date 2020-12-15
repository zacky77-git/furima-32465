class ItemsController < ApplicationController
 
  def index
  end

  def new
    @tweet = Item.new
  end

end
