class Public::HomesController < ApplicationController

  def top
    
  end

  def index
    @items = Item.order(created_at: :desc).limit(4)
  end

end
