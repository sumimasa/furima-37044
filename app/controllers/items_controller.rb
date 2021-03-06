class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :item_params_id, only: [:show, :edit, :update, :destroy]
  before_action :move_index, only: [:edit, :destroy]
  def index
    @items = Item.order('created_at DESC').includes(:order)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else

      render :edit

    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :cost_allocation_id, :area_id, :send_standard_id,
                                 :price).merge(user_id: current_user.id)
  end

  def item_params_id
    @item = Item.find(params[:id])
  end

  def move_index
    if @item.user_id != current_user.id || !@item.order != nil
      redirect_to root_path 
    end
  end
end
