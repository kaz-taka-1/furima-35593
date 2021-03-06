class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gate

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
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
    params.require(:purchase_address).permit(:postal_code, :prefectures_id, :municipalities, :street_number, :building_number, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pry_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_gate
    @item = Item.find(params[:item_id])
    redirect_to root_path if Purchase.exists?(item_id: @item.id) || @item.user_id == current_user.id
  end
end
