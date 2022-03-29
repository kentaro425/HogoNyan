class Public::ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
      flash[:notice] = "メッセージを送信しました"
      redirect_to request.referer
    else
      flash[:alert] = "送信に失敗しました"
      redirect_to room_path(@chat.room_id)
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :content)
  end
end
