class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    binding.pry
    if @purchase_address.valid?
      pry_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    @item = Item.find(params[:item_id])
    params.require(:purchase_address).permit(:postal_code, :prefectures_id, :municipalities, :street_number, :building_number, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token],price: @item.price)
  end

  def pry_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
