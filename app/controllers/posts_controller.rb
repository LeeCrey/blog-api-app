# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.includes(:user, [:comments]).page(params[:p])

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = @current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    check_user_permission_for(@post) do |post|
      if post.update(post_params)
        render json: post, status: :ok
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1
  def destroy
    check_user_permission_for(@post) do |post|
      post.destroy
      head :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by_id(params[:id])
    raise PostNotFoundException if @post.blank?
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
