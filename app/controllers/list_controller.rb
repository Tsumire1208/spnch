class ListController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to ("/top/index")
    else
      @list.valid?
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to ("/top/index")
    else
      @list.valid?
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to ("/top/index")
  end
  
  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end

    def set_list
      @list = List.find(params[:id])
    end
end
