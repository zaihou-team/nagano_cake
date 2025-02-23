class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    if item.save
      if Item.count == 1
        redirect_to admin_items_path
      else
        redirect_to admin_item_path(item.id)
      end
    end
  end
  
  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
  
end
