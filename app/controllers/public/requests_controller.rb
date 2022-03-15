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
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    request = Request.find(params[:id])
    if params[:request][:image_ids]
      params[:request][:image_ids].each do |image_id|
        image = request.request_images.find(image_id)
        image.purge
      end
    end
    if request.update(request_params)
      flash[:success] = "編集しました"
      redirect_to request_path
    else
      render :edit
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:success] = "作成しました"
    redirect_to requests_path
  end

  def search
  end

  private

  def request_params
    params.require(:request).permit(:user_id, :prefecture_id, :title, :breed, :size, :sex, :age, :vaccine, :surgery, :pattern, :information, request_images: [])
  end

end
