# frozen_string_literal: true

class Api::V1::Android::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :set_comment, only: %i[update destroy]
  before_action :set_post, only: %i[index create]

  # GET /api/v1/android/posts/:post_id/comments
  def index
    @comments = @post.comments

    render json: @comments
  end

  # POST /api/v1/android/posts/:post_id/comments
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = @current_user.id

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/android/comments/:id
  def update
    authorize @comment

    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/android/comments/:id
  def destroy
    authorize @comment

    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])

    raise_if_blank(@comment)
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])

    raise_if_blank(@post)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
