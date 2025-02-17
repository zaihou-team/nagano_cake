class Admin::ItemsController < ApplicationController

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
      params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active)
    end
  
end
