class PostsController < ApplicationController
  before_action :find_group
  before_action :authenticate_user!, except: [:show]
  before_action :member_required, only: [:new, :create]

  def show
    @post = @group.posts.includes(:messages).find(params[:id])
    @messages = @post.messages
    @message = Message.new
  end

  def new
    @post = @group.posts.build
  end

  def create
    @post = @group.posts.new(post_params)
    @post.author = current_user

    @post.save ? (redirect_to group_path(@group)) : (render :new)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    @post.update(post_params) ? (redirect_to group_path(@group)) : (render :edit)
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    @post.destroy

    redirect_to group_path(@group)
  end

  private

  def find_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def member_required
    if !current_user.is_member_of?(@group)
      flash[:warning] = "You are not member of this group!"
      redirect_to group_path(@group)
    end
  end
end
