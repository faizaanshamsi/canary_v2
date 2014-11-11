class ItemsController < ApplicationController
  def new
    authorize_location!
    @item = Item.new
    @rooms = Room.includes(:categories)
    @locations = current_user.locations.order(default: :desc)
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    # TODO: Seed submission types and set this to owner submitted
    @item.submission = Submission.first
    if @item.save
      @item.asking_prices << AskingPrice.create(amount: params[:asking_price])
      flash[:notice] =  "Item created successfully"
      redirect_to new_item_item_photo_path(@item)
    else
      @rooms = Room.includes(:categories)
      @locations = current_user.locations.order(default: :desc)
      flash[:error] = "Item could not be saved"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :location_id, :description,
                                 :dimensions, :brand, :condition,
                                 :purchase_price, :age, :category_id)
  end
end
