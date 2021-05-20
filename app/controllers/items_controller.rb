class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    
    if current_user.id != @item.user_id 
      # unless Purchase.exists?(item_id:@item.id)
        @item = Item.all
        render :index
      # end
    end
  end  

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :deliverycharge_id, :prefectures_id, :deliverydays_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
