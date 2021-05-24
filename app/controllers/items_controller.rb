class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
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
  end

  def edit
    if current_user.id != @item.user_id
      # unless Purchase.exists?(item_id:@item.id)
      redirect_to items_path
      # end
    end
  end

  def update
    if @item.update(item_params) && current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :deliverycharge_id, :prefectures_id, :deliverydays_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
