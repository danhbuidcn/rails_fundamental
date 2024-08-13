# frozen_string_literal: true

class BlogPostsController < ApplicationController
  before_action :blog_post, only: %i[show edit update destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show; end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    return redirect_to @blog_post if @blog_post.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    return redirect_to @blog_post if @blog_post.update(blog_post_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path
  end

  private

  def blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
