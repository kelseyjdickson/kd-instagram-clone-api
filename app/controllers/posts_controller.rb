class PostsController < ApplicationController
include Rails.application.routes.url_helpers

    def index
        if(params[:id] == session[:user_id])
        render json: Post.all
    end
    
    def create
        post = Post.create(caption: post_params["caption"])
        post.avatar.attach(post_params["file"])
        post.photo_url = post.avatar.blob.service_url
        if post.save
            render json: post
        else 
            render json: {
                error: "Not Workin"
            }
    end
end

    private
    def post_params
        params.permit(:file,:caption, :likes)
    end
end


