class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:format])
    @purchase_address = PurchaseAddress.new
  end
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      ridirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.repuire(:purchase_address).permit(:postal_code, :prefectures_id, :municipalities, :street_number, :building_number, :phone_number).merge(user_id: current_user.id)#,purchase_id: @purchase.id)
  end

end
