class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_params_id, only: [:show, :edit]
  before_action :move_index, only: [:edit]
  def index
    @items = Item.order('created_at DESC').includes(:user)
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      render :edit
    end
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
    @item = Item.find(params[:id])
    redirect_to root_path if @item.user_id != current_user.id
  end
end
