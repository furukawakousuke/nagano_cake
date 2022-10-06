class Public::HomesController < ApplicationController
   
  
  def top
    @genres = Genre.all
    @item = Item.all
  end

  def about
  end
end


private
def item_params
  params.require(:item).permit(:name,:introduction,:image,:genre_id,)
end