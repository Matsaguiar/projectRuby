class PostsController < ApplicationController

    before_action :require_logged_in_user
  
  
    def index
        @posts = current_user.posts
    end
  
    def new
        @post = post.new
    end
  
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = 'Post criado.'
            redirect_to user_posts_path
        else
            render 'new'
        end
    end
  
    def edit
        @post = current_user.posts.find_by(id: params[:id])
        if @post.nil?
            flash[:danger] = 'Post não encontrado.'
            redirect_to user_posts_path(current_user)
        end
    end
  
    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            flash[:success] = 'Post atualizado.'
            redirect_to user_posts_path
        else
            render 'edit'
        end
    end
  
    def destroy
        @post = current_user.posts.find(params[:id])
        if @post.destroy
            flash[:success] = 'Post removido.'
            redirect_to user_posts_path
        else
            flash[:danger] = 'Post não encontrado.'
            redirect_to user_posts_path(current_user)
        end
    end
  
    private
        def post_params
            params.require(:post).permit(:title, :text)
        end
  end