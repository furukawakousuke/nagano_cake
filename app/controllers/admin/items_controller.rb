class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  def show
  end

  def edit
  end
end

private
def item_params
  params.require(:item).permit(:name,:introduction,:image,:genre_id,:price,:is_active)
end

