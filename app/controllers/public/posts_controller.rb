class Public::PostsController < ApplicationController
  before_action :search_product, only: [:index, :show, :search]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list=params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = "投稿を作成しました"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list=@post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = post.post_images.find(image_id)
        image.purge
      end
    end
    tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to post_path(@post.id),notice:'投稿完了しました:)'
    else
      render:edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_path
  end

  def search
    @comment = Comment.new
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
　　　　　　　#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
　　　　　　　　#検索されたタグに紐づく投稿を表示
    @posts=@tag.posts.page(params[:page]).per(10)
  end

  private

  def search_product
    @p = Post.ransack(params[:q])  # 検索オブジェクトを生成
    @results = @p.result
  end

  def post_params
    params.require(:post).permit(:user_id, :body, post_images: [])
  end
end
