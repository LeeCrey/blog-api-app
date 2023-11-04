# frozen_string_literal: true

class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  include Pundit::Authorization

  before_action :set_post, only: %i[update destroy]

  # GET /posts
  def index
    @posts = Post.includes(:user, [:comments]).page(params[:p])

    render json: @posts
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    authorize @post

    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    authorize @post

    @post.destroy

    head :no_content
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
