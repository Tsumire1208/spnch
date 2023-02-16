class CardController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_all, only: [:show, :edit, :update]
  before_action :set_list, only: [:new, :edit]


  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to ("/top/index")
    else
      @list = List.find params[:list_id]
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to ("/top/index")
    else
      @card.valid?
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to ("/top/index")
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end

  def set_card
    @card = Card.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_all
    @lists = List.all
  end
end
