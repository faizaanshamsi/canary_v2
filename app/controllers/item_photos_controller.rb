class ItemPhotosController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_photos = @item.item_photos
  end

  def new
   @item = Item.find(params[:item_id]) 
   @item_photo = @item.item_photos.build
  end

  def create
    urls = params[:item_photo][:photo].split(',')
    binding.pry
    urls.each do |url|
      ItemPhoto.create(photo: url, item_id: params[:item_id])
    end
    redirect_to item_item_photos_path(params[:item_id])
  end
end
