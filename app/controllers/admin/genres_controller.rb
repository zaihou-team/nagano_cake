class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all #customerのトップのジャンル一覧機能
  end
end
