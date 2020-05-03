class CartItemsController < ApplicationController
  def index
    @products = Product.all #テスト仮記載　岡田
  end
end
