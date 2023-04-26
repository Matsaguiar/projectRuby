class CommentsController < ApplicationController

    before_action :require_logged_in_user
  
  
    def index
        @comments = current_post.comments
    end
  
    def new
        @comment = comment.new
    end
  
    def create
        @comment = current_post.comments.build(comment_params)
        if @comment.save
            flash[:success] = 'Comentario criado.'
            redirect_to post_comments_path
        else
            render 'new'
        end
    end
  
    def edit
        @comment = current_post.comments.find_by(id: params[:id])
        if @comment.nil?
            flash[:danger] = 'Comentario não encontrado.'
            redirect_to post_comments_path(current_post)
        end
    end
  
    def update
        @comment = current_post.comments.find(params[:id])
        if @comment.update(comment_params)
            flash[:success] = 'Comentario atualizado.'
            redirect_to post_comments_path
        else
            render 'edit'
        end
    end
  
    def destroy
        @comment = current_post.comments.find(params[:id])
        if @comment.destroy
            flash[:success] = 'Comentario removido.'
            redirect_to post_comments_path
        else
            flash[:danger] = 'Comentario não encontrado.'
            redirect_to post_comments_path(current_post)
        end
    end
  
    private
        def comment_params
            params.require(:comment).permit(:name, :observation)
        end
  end