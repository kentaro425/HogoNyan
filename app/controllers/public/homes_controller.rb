class Public::HomesController < ApplicationController
  def top
    @requests = Request.page(params[:page]).per(8)
    @p = Request.ransack(params[:q])  # 検索オブジェクトを生成
    @results = @p.result.page(params[:page]).per(8)
  end

  def about
  end
end
