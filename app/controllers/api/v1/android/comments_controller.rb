# frozen_string_literal: true

class Api::V1::Android::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :set_comment, only: %i[show update destroy]
  before_action :set_post, only: %i[index create]

  # GET /posts/:post_id/comments
  def index
    @comments = @post.comments

    render json: @comments
  end

  # GET /comments/:id
  def show
    render json: @comment
  end

  # POST /posts/:post_id/comments
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = @current_user.id

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    check_user_permission_for(@comment) do |comment|
      if comment.update(comment_params)
        render json: comment, status: :ok
      else
        render json: comment.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /comments/:id
  def destroy
    check_user_permission_for(@comment) do |comment|
      comment.destroy
      head :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find_by(id: params[:id])

    raise_if_blank(@comment)
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])

    raise_if_blank(@post)
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
