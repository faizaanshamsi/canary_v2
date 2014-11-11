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
    @item = Item.find(params[:item_id])
    urls = params[:item_photo][:photo].split(',')
    if urls.empty? && @item.item_photos.empty?
      flash[:notice] = 'You must provide at least one image'
      @item_photo = @item.item_photos.build
      render :new
    else
      @item_photos = []
      urls.each do |url|
        @item_photos << ItemPhoto.create(photo: url, item: @item)
      end
      if @item_photos.select { |ip| ip.errors[:number_of_photos] }.empty?
        flash[:notice] = 'Images added successfully'
      else
        flash[:notice] = "You may not upload more than #{ItemPhoto.max_photos} photos."
      end
      redirect_to user_item_path(current_user, @item)
    end
  end
end
