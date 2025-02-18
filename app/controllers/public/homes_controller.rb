class Public::HomesController < ApplicationController

  def top
    @items = Item.order(created_at: :desc).limit(4)
    @genres = Genre.distinct.pluck(:genre_name) # 重複排除したgenre_nameの配列を取得
  end

  def index
  end

  def about
  end

end
