class Public::RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def index
    @request = Request.all
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:notice] = "投稿を作成しました"
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :prefecture_id, :title, :breed, :size, :sex, :age, :vaccine, :surgery, :pattern, :information, request_images: [])
  end

end
