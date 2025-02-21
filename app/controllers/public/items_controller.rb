class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]) # 並び順を指定
    @genres = Genre.distinct.pluck(:genre_name) # 重複排除したgenre_nameの配列を取得
  end
  def show
    @item = Item.find(params[:id])
    @genres = Genre.distinct.pluck(:genre_name) # 重複排除したgenre_nameの配列を取得
    @cart_item = CartItem.new
  end

  def add_to_cart
    item = Item.find(params[:id])
  end
end
