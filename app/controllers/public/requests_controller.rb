class Public::RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :search]
  before_action :search_product, only: [:index, :search]
  before_action :ensure_currect_user, only: [:update, :edit, :destroy]

  def new
    @request = Request.new
  end

  def index
    @requests = Request.page(params[:page]).per(10)
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:notice] = "投稿を作成しました"
      redirect_to request_path(@request)
    else
      flash[:alert] = "必要事項を入力してください"
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
    @user = @request.user
    if user_signed_in?
      @current_user_room = UserRoom.where(user_id: current_user.id)
      @another_user_room = UserRoom.where(user_id: @user.id)
      unless @user.id == current_user.id
        @current_user_room.each do |current|
          @another_user_room.each do |another|
            if (current.room_id == another.room_id) && (current.request_id == another.request_id) && (another.request_id == @request.id)
              @is_room = true
              @room_id = current.room_id
            end
          end
        end
      end
    end
  end

  def inquiry
    @request = Request.find(params[:id])
    @user = @request.user
    @room = Room.new
    @user_room = UserRoom.new
    @chat = Chat.new
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
      flash[:notice] = "編集しました"
      redirect_to request_path
    else
      flash[:alert] = "必要事項を入力してください"
      render :edit
    end
  end

  def status_update
    @request = Request.find(params[:request][:id])
    if @request.update(status: params[:request][:status])
      flash[:notice] = "変更しました"
      if @request.status == "里親決定済"
        # 取引完了通知
        temp = Notification.where(["visiter_id = ? and visited_id = ? and request_id = ? and action = ? ", current_user.id, params[:request][:visited_id], params[:request][:id], 'complete'])
        if temp.blank?
          notification = current_user.active_notifications.new(
            visited_id: params[:request][:visited_id],
            request_id: params[:request][:id],
            action: 'complete'
          )
          notification.save if notification.valid?
        end
      end
      redirect_to room_path(params[:id])
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:alert] = "削除しました"
    redirect_to requests_path
  end

  def search
  end

  private

  def search_product
    @p = Request.ransack(params[:q])  # 検索オブジェクトを生成
    @results = @p.result.page(params[:page]).per(10)
  end

  def ensure_currect_user
    @request = Request.find(params[:id])
    unless @request.user == current_user
      redirect_to requests_path
    end
  end


  def request_params
    params.require(:request).permit(:user_id, :prefecture_id, :title, :breed, :size, :sex, :age, :vaccine, :surgery, :pattern, :information, :status, request_images: [])
  end
end
