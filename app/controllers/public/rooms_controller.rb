class Public::RoomsController < ApplicationController
  def create
    room = Room.create
    @current_user_room = UserRoom.create(user_id: current_user.id, room_id: room.id, request_id: params[:room][:request_id])
    @another_user_room = UserRoom.create(user_id: params[:room][:user_id], room_id: room.id, request_id: params[:room][:request_id])
    @chat = Chat.create(user_id: current_user.id, room_id: room.id, content: params[:room][:content])
    redirect_to room_path(room)
  end

  def index
    # ログインユーザー所属ルームID取得
    current_user_rooms = current_user.user_rooms
    my_room_id = []
    current_user_rooms.each do |user_room|
      my_room_id << user_room.room.id
    end
    # 自分のroom_idでuser_idが自分じゃないのを取得
    @another_user_rooms = UserRoom.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new
    @user_rooms = @room.user_rooms
    @another_user_room = @user_rooms.where.not(user_id: current_user.id).first
    @request = Request.find(@another_user_room.request_id)
  end
end
